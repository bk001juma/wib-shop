import 'package:flutter/material.dart';
import 'package:wibshop/components/homescreen/home_screen.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

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
                      // If "Yes" is pressed, navigate to the home screen
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
                      // If "No" is pressed, close the bottom sheet
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
    throw UnimplementedError();
  }
}

void main() {
  runApp(MaterialApp(
    home: LogoutPage(),
  ));
}
