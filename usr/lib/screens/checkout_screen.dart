import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _paymentMethod = 'COD';

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: cart.items.map((item) => ListTile(
                  title: Text(item.product.name),
                  subtitle: Text('Qty: ${item.quantity} - ₹${item.totalPrice}'),
                )).toList(),
              ),
            ),
            const Text('Delivery Address: Your Address Here'),
            const SizedBox(height: 20),
            const Text('Payment Method'),
            RadioListTile<String>(
              title: const Text('Cash on Delivery (COD)'),
              value: 'COD',
              groupValue: _paymentMethod,
              onChanged: (value) => setState(() => _paymentMethod = value!),
            ),
            RadioListTile<String>(
              title: const Text('UPI Payment'),
              value: 'UPI',
              groupValue: _paymentMethod,
              onChanged: (value) => setState(() => _paymentMethod = value!),
            ),
            ElevatedButton(
              onPressed: () {
                cart.clear();
                Navigator.pushNamed(context, '/tracking');
              },
              child: Text('Place Order - ₹${cart.totalPrice}'),
            ),
          ],
        ),
      ),
    );
  }
}