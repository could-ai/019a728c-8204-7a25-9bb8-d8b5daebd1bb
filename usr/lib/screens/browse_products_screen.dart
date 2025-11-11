import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class BrowseProductsScreen extends StatelessWidget {
  const BrowseProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as String? ?? 'All';
    final filteredProducts = category == 'All'
        ? products
        : products.where((p) => p.category == category).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Browse $category')),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('₹${product.price}'),
            trailing: ElevatedButton(
              onPressed: () {
                context.read<Cart>().addItem(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} added to cart')),
                );
              },
              child: const Text('Add to Cart'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/checkout'),
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}