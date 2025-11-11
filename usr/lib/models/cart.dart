import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(Product product) {
    final existingIndex = _items.indexWhere((item) => item.product.name == product.name);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(String productName) {
    _items.removeWhere((item) => item.product.name == productName);
    notifyListeners();
  }

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get totalPrice => product.price * quantity;
}

class Product {
  final String name;
  final double price;
  final String category;

  Product({required this.name, required this.price, required this.category});
}

final List<Product> products = [
  Product(name: 'Tomatoes', price: 40.0, category: 'Vegetables'),
  Product(name: 'Onions', price: 30.0, category: 'Vegetables'),
  Product(name: 'Bananas', price: 50.0, category: 'Fruits'),
  Product(name: 'Apples', price: 80.0, category: 'Fruits'),
  Product(name: 'Rice', price: 60.0, category: 'Groceries'),
];