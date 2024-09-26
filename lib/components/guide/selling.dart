// lib/components/screens/selling_guide_screen.dart

import 'package:flutter/material.dart';

class SellingGuideScreen extends StatelessWidget {
  const SellingGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selling Guide"),
        backgroundColor: const Color.fromARGB(255, 238, 200, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "How to Sell Products",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildStep("1. Register as a Supplier", [
              "Create an account or log in if you already have one.",
              "Enter necessary details such as business name, contact information, and verification documents.",
              "Wait for account approval from the platform's admin team."
            ]),
            const SizedBox(height: 20),
            _buildStep("2. Set Up Your Store", [
              "Complete your store profile with a logo, description, and contact details.",
              "Enter your bank details or payment preferences for receiving payments."
            ]),
            const SizedBox(height: 20),
            _buildStep("3. Add Products", [
              "Enter product details including name, category, description, and specifications.",
              "Set the price, including any discounts or bulk pricing options.",
              "Upload high-quality images of your products.",
              "Specify stock quantities and update inventory as needed."
            ]),
            const SizedBox(height: 20),
            _buildStep("4. Configure Shipping", [
              "Define your shipping methods and rates.",
              "Set the expected handling time for processing orders.",
              "Specify the geographic areas you can ship to."
            ]),
            const SizedBox(height: 20),
            _buildStep("5. Manage Orders", [
              "Monitor new orders and receive notifications.",
              "Prepare and pack orders based on the details provided.",
              "Mark orders as shipped and provide tracking information."
            ]),
            const SizedBox(height: 20),
            _buildStep("6. Handle Returns and Exchanges", [
              "Clearly state your return and exchange policies.",
              "Handle return requests and manage exchanges as per your policy."
            ]),
            const SizedBox(height: 20),
            _buildStep("7. Monitor Performance", [
              "Review sales reports and performance analytics.",
              "Respond to customer reviews and feedback."
            ]),
            const SizedBox(height: 20),
            _buildStep("8. Customer Support", [
              "Address customer inquiries and provide support as needed.",
              "Manage any disputes or issues that arise with customers."
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String stepTitle, List<String> stepDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stepTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...stepDetails.map((detail) => Text(
              detail,
              style: const TextStyle(fontSize: 16),
            )),
      ],
    );
  }
}
