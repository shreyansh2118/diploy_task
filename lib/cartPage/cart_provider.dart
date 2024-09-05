import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  List<dynamic> _cart = [];

  List<dynamic> get cart => _cart;

  void addToCart(dynamic product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(dynamic product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  int get cartCount => _cart.length;
}
