import 'package:flutter/material.dart';
import 'package:wibshop/components/admin/dashboard.dart';
import 'package:wibshop/components/admin/side_menu.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(flex: 5, child: DashboardScreen()),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title;
  final IconData icon; // Change type to IconData
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 3,
      leading: Icon(icon, color: Colors.white54), // Optional: Set icon color
      title: Text(
        title,
        style: TextStyle(color: Colors.white54, fontSize: 20),
      ),
    );
  }
}
