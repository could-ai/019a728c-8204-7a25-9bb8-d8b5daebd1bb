import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/browse_products_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/order_tracking_screen.dart';
import 'models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'GramBazaar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFFFF8C00), // Orange
          colorScheme: const ColorScheme.light(
            primary: Color(0xFFFF8C00),
            secondary: Color(0xFF4CAF50), // Green
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SignupScreen(),
          '/home': (context) => const HomeScreen(),
          '/browse': (context) => const BrowseProductsScreen(),
          '/checkout': (context) => const CheckoutScreen(),
          '/tracking': (context) => const OrderTrackingScreen(),
        },
      ),
    );
  }
}