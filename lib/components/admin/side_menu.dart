import 'package:flutter/material.dart';
import 'package:wibshop/components/admin/admin.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("asset/images/logo.png"),
            ),
            DrawerListTile(
              title: "Dashboard",
              icon: Icons.dashboard, // Use the appropriate icon
              press: () {
                // Handle Dashboard press
              },
            ),
            DrawerListTile(
              title: "Transaction",
              icon: Icons.payment, // Use the appropriate icon
              press: () {
                // Handle Transaction press
              },
            ),
            DrawerListTile(
              title: "Orders",
              icon: Icons.list_alt, // Use the appropriate icon
              press: () {
                // Handle Orders press
              },
            ),
            DrawerListTile(
              title: "Store",
              icon: Icons.store, // Use the appropriate icon
              press: () {
                // Handle Store press
              },
            ),
            DrawerListTile(
              title: "Notification",
              icon: Icons.settings, // Use the appropriate icon
              press: () {
                // Handle Store press
              },
            ),
            DrawerListTile(
              title: "Settings",
              icon: Icons.store, // Use the appropriate icon
              press: () {
                // Handle Store press
              },
            ),
          ],
        ),
      ),
    );
  }
}
