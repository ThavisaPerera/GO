// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unnecessary_new, prefer_interpolation_to_compose_strings

import 'dart:collection';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_app2/themes/theme_colors.dart';
import 'package:image_picker/image_picker.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  _ImagesScreenState createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  File? productImage; // Store the selected image file

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery, // Open the image gallery
      imageQuality: 80,
      maxWidth: 800,
      maxHeight: 800,
    );

    // Check if an image was picked
    if (pickedImage != null) {
      setState(() {
        // Update the selected image
        productImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _productImageUpload() async {
    if (productImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select an image.'),
        ),
      );
      return;
    }

    // Create a reference to the Firebase Storage bucket
    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('product_images')
        .child(new DateTime.now().millisecondsSinceEpoch.toString() +
            "" +
            productImage!.path);

    // Upload the image to Firebase Storage
    final UploadTask uploadTask = storageReference.putFile(productImage!);

    // Get the download URL when the upload is complete
    await uploadTask.whenComplete(() async {
      final imageUrl = await storageReference.getDownloadURL();
      String url = imageUrl.toString();
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref().child("product");
      String? uploadId = databaseReference.push().key;
      HashMap map = new HashMap();
      map["imgUrl"] = url;

      databaseReference.child(uploadId!).set(map);

      // Clear the selected image
      setState(() {
        productImage = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["darkBG"]
          : lightModeColors["lightBG"],
      body: Padding(
        padding:
            const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: isDarkModeEnabled
                        ? darkModeColors["white"]
                        : lightModeColors["black"],
                  ),
                  onPressed: () async {
                    if (productImage == null) {
                      await _pickImage();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('You can only add one image.'),
                        ),
                      );
                    }
                  },
                ),
                Text(
                  'Add Image',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isDarkModeEnabled
                        ? darkModeColors["white"]
                        : lightModeColors["black"],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: productImage != null
                    ? Image.file(
                        productImage!,
                        fit: BoxFit.cover,
                        width: 300,
                        height: 300,
                      )
                    : SizedBox(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: _productImageUpload,
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
    );
  }
}
