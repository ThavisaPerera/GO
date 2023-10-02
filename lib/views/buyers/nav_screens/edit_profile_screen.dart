// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_app2/themes/theme_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() {
    return _EditProfileScreenState();
  }
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  User? currentUser; // To store the current user

  Future<void> getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });

      // Upload the selected image to Firebase Storage
      final String uid = currentUser!.uid;
      final Reference storageRef =
          _storage.ref().child('profile_images').child(uid);
      await storageRef.putFile(selectedImage!);

      // Get the download URL of the uploaded image
      final String imageURL = await storageRef.getDownloadURL();

      // Update the user's profile image URL in Firestore
      await _firestore.collection('users').doc(uid).update({
        'profileImageURL': imageURL,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    currentUser = _auth.currentUser;
    // Fetch the user's information from Firestore and set it in the text fields
    _firestore.collection('users').doc(currentUser!.uid).get().then((snapshot) {
      final data = snapshot.data() as Map<String, dynamic>;
      nameController.text = data['name'] ?? '';
      lastNameController.text = data['lastName'] ?? '';
      emailController.text = data['email'] ?? '';
      phonenumberController.text = data['phoneNumber'] ?? '';
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
              const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  getImage(ImageSource.camera);
                },
                child: selectedImage == null
                    ? Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffD6D6D6)),
                        child: Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(selectedImage!),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle,
                            color: Color(0xffD6D6D6)),
                      ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'First Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkModeEnabled
                        ? darkModeColors["white"]
                        : lightModeColors["black"],
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 320,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isDarkModeEnabled
                        ? darkModeColors["lightBG"]
                        : lightModeColors["grey"],),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Last Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkModeEnabled
                        ? darkModeColors["white"]
                        : lightModeColors["black"],
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 320,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isDarkModeEnabled
                        ? darkModeColors["lightBG"]
                        : lightModeColors["grey"],),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'E-mail',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkModeEnabled
                        ? darkModeColors["white"]
                        : lightModeColors["black"],
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 320,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isDarkModeEnabled
                        ? darkModeColors["lightBG"]
                        : lightModeColors["grey"],),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkModeEnabled
                        ? darkModeColors["white"]
                        : lightModeColors["black"],
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 320,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isDarkModeEnabled
                        ? darkModeColors["lightBG"]
                        : lightModeColors["grey"],),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: phonenumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () async {
                  // Update the user's information in Firestore
                  final String uid = currentUser!.uid;
                  await _firestore.collection('users').doc(uid).update({
                    'name': nameController.text,
                    'lastName': lastNameController.text,
                    'email': emailController.text,
                    'phoneNumber': phonenumberController.text,
                  });

                  // Navigate back or perform any other action as needed
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
