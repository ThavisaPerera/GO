// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_print, unnecessary_new

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_app2/themes/theme_colors.dart';

void main() {
  runApp(MaterialApp(
    home: ShippingScreen(),
  ));
}

class ShippingScreen extends StatefulWidget {
  @override
  _ShippingScreenState createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  bool _chargeShipping = false;
  final TextEditingController _shippingChargeController =
      TextEditingController();

  @override
  void dispose() {
    _shippingChargeController.dispose();
    super.dispose();
  }

  Future<void> _shippingUpload() async {
    final chargeShipping = _chargeShipping;
    final shippingCharge = _shippingChargeController.text;

    try {
      // Get the current user's ID from Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;

        // Initialize Firebase if it's not already initialized
        if (Firebase.apps.isEmpty) {
          await Firebase.initializeApp();
        }

        final firestore = FirebaseFirestore.instance;

        // Upload data to the Firestore subcollection inside the user's document
        await firestore
            .collection('users')
            .doc(userId)
            .collection('products')
            .add({
          'chargeShipping': chargeShipping,
          'shippingCharge': shippingCharge,
        });

        print('Data uploaded to Firestore');

        DatabaseReference databaseReference =
            FirebaseDatabase.instance.ref().child("product");
        String? uploadId = databaseReference.push().key;
        HashMap map = new HashMap();
        map["shippingCharge"] = shippingCharge;

        databaseReference.child(uploadId!).set(map);
      } else {
        print('No signed-in user.');
      }
    } catch (e) {
      print('Error uploading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["darkBG"]
          : lightModeColors["lightBG"],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            right: 20,
            left: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Charge Shipping',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isDarkModeEnabled
                          ? darkModeColors["white"]
                          : lightModeColors["black"],
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _chargeShipping = !_chargeShipping;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _chargeShipping
                            ? isDarkModeEnabled
                                ? darkModeColors["purple"]
                                : lightModeColors["blue"]
                            : isDarkModeEnabled
                                ? darkModeColors["darkBG"]
                                : lightModeColors["white"],
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color.fromARGB(255, 36, 76, 255),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: _chargeShipping
                            ? Icon(
                                Icons.check,
                                size: 20.0,
                                color: isDarkModeEnabled
                                    ? darkModeColors["darkBG"]
                                    : lightModeColors["white"],
                              )
                            : Icon(
                                Icons.check_box_outline_blank,
                                size: 20.0,
                                color: isDarkModeEnabled
                                    ? darkModeColors["darkBG"]
                                    : lightModeColors["white"],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              if (_chargeShipping)
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Shipping Charge',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDarkModeEnabled
                              ? darkModeColors["white"]
                              : lightModeColors["black"],
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 320,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isDarkModeEnabled
                            ? darkModeColors["lightBG"]
                            : lightModeColors["grey"],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: _shippingChargeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 400,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: _shippingUpload,
                    child: Container(
                      width: 290,
                      height: 45,
                      decoration: BoxDecoration(
                        color: isDarkModeEnabled
                            ? darkModeColors["purple"]
                            : lightModeColors["blue"],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
