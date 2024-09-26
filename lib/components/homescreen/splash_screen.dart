import 'package:flutter/material.dart';
import 'package:wibshop/components/homescreen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 5, 5, 5), // Background color of the splash screen
      body: Column(
        children: <Widget>[
          // This Expanded widget takes up all available space above the text
          Expanded(
            child: Center(
              child: Image.asset(
                "asset/images/logo.png",
                width: 200,
              ),
            ),
          ),
          // Padding ensures text is not too close to the edges
          Padding(
            padding: const EdgeInsets.all(16.0), // Space around the text
            child: Text(
              "Powered by WIB CO LTD",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
