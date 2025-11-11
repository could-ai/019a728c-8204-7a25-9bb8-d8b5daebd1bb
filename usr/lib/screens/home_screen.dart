import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GramBazaar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton(context, 'Vegetables', Icons.grass),
                _buildCategoryButton(context, 'Fruits', Icons.apple),
                _buildCategoryButton(context, 'Groceries', Icons.kitchen),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Emergency cash logic
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Emergency Cash'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [500, 1000, 2000, 5000].map((amount) =>
                        ListTile(
                          title: Text('₹$amount'),
                          onTap: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Emergency cash ₹$amount requested')),
                            );
                          },
                        ),
                      ).toList(),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text('Get Emergency Cash'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/browse');
              break;
            case 2:
              Navigator.pushNamed(context, '/tracking');
              break;
            case 3:
              // Account screen, for now stay
              break;
          }
        },
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String category, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/browse',
          arguments: category,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF8C00),
        padding: const EdgeInsets.all(20),
        shape: const CircleBorder(),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.white),
          Text(category, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}