// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_app2/themes/theme_colors.dart';

class PublishedScreen extends StatelessWidget {
  const PublishedScreen({Key? key});

  Future<void> _deletePublishedProduct(String productId, String userId) async {
    final productReference = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('publish')
        .doc(productId);

    await productReference.delete();
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
            .collection('publish') // Use the "publish" subcollection
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final publishedProducts = snapshot.data!.docs;

          if (publishedProducts.isEmpty) {
            return Center(child: Text('No published products available.'));
          }

          return ListView.builder(
            itemCount: publishedProducts.length,
            itemBuilder: (context, index) {
              final product =
                  publishedProducts[index].data() as Map<String, dynamic>;
              final productId = publishedProducts[index].id;

              return Card(
                margin: EdgeInsets.all(8.0),
                elevation: 3.0,
                color: isDarkModeEnabled
                    ? darkModeColors["black"]
                    : lightModeColors["white"],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
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
                      SizedBox(width: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                _deletePublishedProduct(productId, userId);
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
