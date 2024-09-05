import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartController {
  final BuildContext context;

  CartController({required this.context});

  Future<void> addToFirestore(Map<String, dynamic> productData) async {
    try {
      CollectionReference collRef =
          FirebaseFirestore.instance.collection('product');
      await collRef.add({
        'name': productData['name'],
        'price': productData['price'],
        'desc': productData['desc'],
        'image': productData['image'],
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${productData['name']} added to Cart.')),
      );
    } catch (e) {
      print("Error adding product to Firestore: $e");
    }
  }

  Future<void> removeFromFirestore(String productId) async {
    try {
      await FirebaseFirestore.instance
          .collection('product')
          .doc(productId)
          .delete();
      print("Product removed from Firestore: $productId");
    } catch (e) {
      print("Error removing product from Firestore: $e");
    }
  }

  void addProductToCart(dynamic product) {
    Provider.of<CartProvider>(context, listen: false).addToCart(product);
  }

  void removeProductFromCart(dynamic product, String productId) {
    Provider.of<CartProvider>(context, listen: false).removeFromCart(product);
    removeFromFirestore(productId);
  }

  void clearCart() {
    Provider.of<CartProvider>(context, listen: false).clearCart();
  }
}
