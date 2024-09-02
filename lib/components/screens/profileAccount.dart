import 'package:flutter/material.dart';
import 'package:wibSHOP/components/screens/Privacy.dart';
import 'package:wibSHOP/components/screens/Settings.dart';
import 'package:wibSHOP/components/screens/help_center.dart';
import 'package:wibSHOP/components/screens/manage_store.dart';
import 'package:wibSHOP/components/screens/my_order.dart';
import 'package:wibSHOP/components/screens/my_profile.dart';
import 'package:wibSHOP/components/screens/order_history.dart';
import 'package:wibSHOP/main.dart';

class Profileaccount extends StatelessWidget {
  final String customerName = "Baraka Mashimbe"; // Example customer name
  final String profileImage =
      "asset/images/baraka.jpg"; // Path to the profile picture

  const Profileaccount({super.key});

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Are you sure you want to logout?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the home screen if "Yes" is pressed
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text("Yes"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Close the bottom sheet if "No" is pressed
                      Navigator.of(context).pop();
                    },
                    child: Text("No"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 238, 200, 245),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),

              // Profile picture
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(profileImage),
                ),
              ),
              SizedBox(height: 20),

              // Full names
              Text(
                "Full Name: $customerName",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 20),

              // Various options in the profile
              ListTile(
                leading: Icon(Icons.person_2, color: Colors.purple),
                title: Text("My Profile"),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.store, color: Colors.purple),
                title: Text("Manage Store"),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManageStorePage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.shopping_cart_checkout, color: Colors.purple),
                title: Text("My Orders"),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyOrderPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.history, color: Colors.purple),
                title: Text("Order History"),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderHistoryPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.purple),
                title: Text("Settings"),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.purple,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.description, color: Colors.purple),
                title: Text("Privacy Policy"),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicyPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.help_center, color: Colors.purple),
                title: Text("Help Center"),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpCenterPage(),
                    ),
                  );
                },
              ),

              // Log Out Option
              ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.purple),
                title: Text("Log Out"),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
                onTap: () {
                  _showLogoutBottomSheet(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Profileaccount(),
  ));
}
