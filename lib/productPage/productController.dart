import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cartPage/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductController {
  final BuildContext context;

  ProductController({required this.context});

  Future<void> addToFirestore(Map<String, dynamic> productData) async {
    try {
      CollectionReference collRef =
          FirebaseFirestore.instance.collection('product');
      await collRef.add({
        'name': productData['title'],
        'price': productData['price'],
        'desc': productData['description'],
        'image': productData['image'],
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${productData['title']} added to Firestore')),
      );
    } catch (e) {
      print("Error adding product to Firestore: $e");
    }
  }

  void addProductToCart(dynamic product) {
    Provider.of<CartProvider>(context, listen: false).addToCart(product);
  }
}
