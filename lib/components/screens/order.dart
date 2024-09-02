// lib/components/screens/placing_order_guide_screen.dart

import 'package:flutter/material.dart';

class PlacingOrderGuideScreen extends StatelessWidget {
  const PlacingOrderGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Placing an Order Guide"),
        backgroundColor: const Color.fromARGB(255, 238, 200, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "How to Place an Order",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildStep("1. Browse and Select Products", [
              "Navigate through various product categories to find items you want to purchase.",
              "Use the search bar to find specific products.",
              "Click on products to view detailed information, including images, descriptions, and prices.",
              "Select the quantity of the product you wish to purchase.",
              "Add the selected product to your shopping cart."
            ]),
            const SizedBox(height: 20),
            _buildStep("2. Review Cart", [
              "Access your cart to review the list of selected items.",
              "Adjust quantities or remove items if necessary.",
              "Review the total cost, including item prices, taxes, and shipping fees."
            ]),
            const SizedBox(height: 20),
            _buildStep("3. Proceed to Checkout", [
              "Click on 'Proceed to Checkout' to begin the order placement process.",
              "Sign in to your account or create a new one if you haven’t already.",
              "Provide or confirm your shipping address.",
              "Select a preferred shipping method based on speed and cost.",
              "Provide payment details or choose a saved payment method.",
              "Verify all order details, including items, shipping address, and payment method.",
              "Enter any discount codes or promotional offers, if available.",
              "Click 'Place Order' to complete the purchase."
            ]),
            const SizedBox(height: 20),
            _buildStep("4. Order Confirmation", [
              "Receive an order confirmation via email or app notification with details of your purchase.",
              "Use the provided tracking number to monitor the status of your shipment."
            ]),
            const SizedBox(height: 20),
            _buildStep("5. Post-Purchase Actions", [
              "View your order history to check past purchases and statuses.",
              "Review return policies and request returns or exchanges if needed.",
              "Contact customer support for any issues or inquiries related to your order."
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
