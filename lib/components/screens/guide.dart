import 'package:flutter/material.dart';
import 'package:wibshop/components/screens/account.dart';
import 'package:wibshop/components/screens/buying.dart';
import 'package:wibshop/components/screens/order.dart';
import 'package:wibshop/components/screens/security.dart';
import 'package:wibshop/components/screens/selling.dart';
import 'package:wibshop/components/screens/shipping.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guide"),
        backgroundColor: const Color.fromARGB(255, 238, 200, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _GuideButton(
              title: "Account Management",
              icon: Icons.account_circle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountManagementScreen(),
                  ),
                );
              },
            ),
            _GuideButton(
              title: "Security Issues",
              icon: Icons.lock_outline,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecurityPrivacyGuideScreen(),
                  ),
                );
              },
            ),
            _GuideButton(
              title: "Buying",
              icon: Icons.shopping_cart,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BuyingGuideScreen(),
                  ),
                );
              },
            ),
            _GuideButton(
              title: "Selling",
              icon: Icons.sell,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SellingGuideScreen(),
                  ),
                );
              },
            ),
            _GuideButton(
              title: "Placing Orders",
              icon: Icons.list_alt,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlacingOrderGuideScreen(),
                  ),
                );
              },
            ),
            _GuideButton(
              title: "Shipping Process",
              icon: Icons.local_shipping,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShippingDeliveryGuideScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _GuideButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const _GuideButton({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.purple),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
