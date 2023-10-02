// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_app2/themes/theme_colors.dart';

class UnpublishedScreen extends StatelessWidget {
  const UnpublishedScreen({super.key});

  Future<void> _deleteProduct(String productId, String userId) async {
    final userReference =
        FirebaseFirestore.instance.collection('users').doc(userId);
    final productReference =
        userReference.collection('products').doc(productId);

    final productData = await productReference.get();
    if (productData.exists) {
      // Delete the product from the user's collection
      await productReference.delete();

      // Store the product in the "publish" subcollection within the user's document
      final publishCollection = userReference.collection('publish');
      await publishCollection.add(productData.data() as Map<String, dynamic>);
    }
  }

  Future<void> _publishProduct(String productId, String userId) async {
    final userReference =
        FirebaseFirestore.instance.collection('users').doc(userId);
    final productReference =
        userReference.collection('products').doc(productId);

    final productData = await productReference.get();
    if (productData.exists) {
      // Delete the product from the user's collection
      await productReference.delete();

      // Store the product in the "publish" subcollection within the user's document
      final publishCollection = userReference.collection('publish');
      await publishCollection.add(productData.data() as Map<String, dynamic>);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid ?? '';
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["darkBG"]
          : lightModeColors["lightBG"],
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('products')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data!.docs;

          if (products.isEmpty) {
            return Center(child: Text('No products available.'));
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index].data() as Map<String, dynamic>;
              final productId = products[index].id;

              return Card(
                margin: EdgeInsets.all(8.0),
                elevation: 3.0,
                color: isDarkModeEnabled
                    ? darkModeColors["black"]
                    : lightModeColors["white"],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Name: ${product["productName"]}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: isDarkModeEnabled
                                  ? darkModeColors["white"]
                                  : lightModeColors["black"],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Price: \$${product["productPrice"]}',
                            style: TextStyle(
                              color: isDarkModeEnabled
                                  ? darkModeColors["white"]
                                  : lightModeColors["black"],
                            ),
                          ),
                          Text(
                            'Quantity: ${product["productQuantity"]}',
                            style: TextStyle(
                              color: isDarkModeEnabled
                                  ? darkModeColors["white"]
                                  : lightModeColors["black"],
                            ),
                          ),
                          Text(
                            'Description: ${product["productDescription"]}',
                            style: TextStyle(
                              color: isDarkModeEnabled
                                  ? darkModeColors["white"]
                                  : lightModeColors["black"],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                _deleteProduct(productId, userId);
                              },
                              child: Container(
                                width: 60,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 203, 4, 4),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                _publishProduct(productId,
                                    userId); // Call the publish function
                              },
                              child: Container(
                                width: 60,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 216, 68),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Publish',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
