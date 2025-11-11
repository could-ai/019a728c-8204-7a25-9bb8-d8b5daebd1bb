import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock order data
    const orderStatus = 'Out for Delivery';
    const eta = '30 minutes';
    const items = ['Tomatoes', 'Rice'];

    return Scaffold(
      appBar: AppBar(title: const Text('Order Tracking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: $orderStatus'),
            Text('Delivery ETA: $eta'),
            const SizedBox(height: 20),
            const Text('Items:'),
            ...items.map((item) => Text('- $item')),
          ],
        ),
      ),
    );
  }
}