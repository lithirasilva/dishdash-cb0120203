import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners(); // Notify listeners about the changes
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners(); // Notify listeners about the changes
  }

  void clearCart() {
    _items.clear();
    notifyListeners(); // Notify listeners about the changes
  }
}

class CartItem {
  final String name;
  final int quantity;

  CartItem({required this.name, required this.quantity});
}
