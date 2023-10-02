// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_print, unnecessary_new

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_app2/themes/theme_colors.dart';

class GeneralScreen extends StatefulWidget {
  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productQuantityController =
      TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    productNameController.dispose();
    productPriceController.dispose();
    productQuantityController.dispose();
    productDescriptionController.dispose();
    super.dispose();
  }

  Future<void> _generalUpload() async {
    final productName = productNameController.text;
    final productPrice = productPriceController.text;
    final productQuantity = productQuantityController.text;
    final productDescription = productDescriptionController.text;

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;

        if (Firebase.apps.isEmpty) {
          await Firebase.initializeApp();
        }

        final firestore = FirebaseFirestore.instance;

        await firestore
            .collection('users')
            .doc(userId)
            .collection('products')
            .add({
          'productName': productName,
          'productPrice': productPrice,
          'productQuantity': productQuantity,
          'productDescription': productDescription,
        });

        print('Data uploaded to Firestore');

        DatabaseReference databaseReference =
            FirebaseDatabase.instance.ref().child("product");
        String? uploadId = databaseReference.push().key;
        HashMap map = new HashMap();
        map["productName"] = productName;
        map["productPrice"] = productPrice;
        map["productQuantity"] = productQuantity;
        map["productDescription"] = productDescription;

        databaseReference.child(uploadId!).set(map);

        productNameController.clear();
        productPriceController.clear();
        productQuantityController.clear();
        productDescriptionController.clear();
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
          padding:
              const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Product Name',
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
                    controller: productNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Product Price',
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
                    controller: productPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Product Quantity',
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
                    controller: productQuantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Product Description',
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
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: isDarkModeEnabled
                      ? darkModeColors["lightBG"]
                      : lightModeColors["grey"],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: productDescriptionController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: _generalUpload,
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
