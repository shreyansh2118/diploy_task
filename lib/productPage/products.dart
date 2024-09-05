import 'package:flutter/material.dart';
import 'package:flutter_application_1/productPage/productController.dart';

class ProductPage extends StatefulWidget {
  final dynamic product;

  ProductPage({required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final productController = ProductController(context: context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.product['image'], height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(widget.product['title'],
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('\$${widget.product['price']}',
                style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 16),
            Text(widget.product['description']),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add product to Firestore
                productController.addToFirestore(widget.product);
                // Add product to cart
                productController.addProductToCart(widget.product);
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
