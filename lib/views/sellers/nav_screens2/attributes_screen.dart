// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_new

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_app2/themes/theme_colors.dart';

class AttributesScreen extends StatefulWidget {
  const AttributesScreen({super.key});

  @override
  State<AttributesScreen> createState() => _AttributesScreenState();
}

class _AttributesScreenState extends State<AttributesScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  String selectedSize = 'Small';
  String selectedCategory = 'Fashion';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;


  @override
  void dispose() {
    brandController.dispose();
    super.dispose();
  }

  Future<void> _attributesUpload() async {
    final brand = brandController.text;
    final size = selectedSize;
    final category = selectedCategory;

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
              'brand': brand,
              'size': size,
              'category': category,
            });

        print('Data uploaded to Firestore');

        DatabaseReference databaseReference =
            FirebaseDatabase.instance.ref().child("product");
        String? uploadId = databaseReference.push().key;
        HashMap map = new HashMap();
        map["brand"] = brand;
        map["size"] = size;
        map["category"] = category;

        databaseReference.child(uploadId!).set(map);

        
        brandController.clear();
        
      } else {
        
        print('No signed-in user.');
      }
    } catch (e) {
      print('Error uploading data: $e');
    }
  }
  User? currentUser;

   @override
  void initState() {
    super.initState();
    currentUser = _auth.currentUser;
    // Fetch the user's information from Firestore and set it in the text fields
    _firestore.collection('users').doc(currentUser!.uid).get().then((snapshot) {
      final data = snapshot.data() as Map<String, dynamic>;
      productNameController.text = data['productName'] ?? '';
    });
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
              const EdgeInsets.only(top: 40, right: 20, left: 20,),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Brand',
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
                    controller: brandController,
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
                  'Size',
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
                  child: DropdownButton<String>(
                    value: selectedSize,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSize = newValue!;
                      });
                    },
                    items: <String>['Small', 'Medium', 'Large']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Category',
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
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedCategory,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                            });
                          },
                          items: <String>[
                            'Fashion',
                            'Vehicle',
                            'Electronics',
                            'Beauty',
                            'Jewellery',
                            'Footwear',
                            'Toys',
                            'Mobile'
                          ]
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 220),
           Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: _attributesUpload,
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
