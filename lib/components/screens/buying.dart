// lib/components/screens/buying_guide_screen.dart

import 'package:flutter/material.dart';

class BuyingGuideScreen extends StatelessWidget {
  const BuyingGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buying Guide"),
        backgroundColor: const Color.fromARGB(255, 238, 200, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "How to Buy Products",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildStep("1. Browse Products", [
              "Explore various product categories to find the type of items you're interested in.",
              "Use the search bar to look for specific products by name or keyword.",
              "Apply filters like price range, brand, or ratings to narrow down your search results."
            ]),
            const SizedBox(height: 20),
            _buildStep("2. View Product Details", [
              "Click on a product to view high-resolution images.",
              "Read the detailed description to understand the product features and specifications.",
              "Check the price and any available discounts or offers.",
              "Read customer reviews and ratings to get an idea of the product's quality and performance."
            ]),
            const SizedBox(height: 20),
            _buildStep("3. Add to Cart", [
              "Select the quantity you wish to purchase.",
              "Choose any available options (size, color, etc.).",
              "Click the 'Add to Cart' button to place the item in your shopping cart."
            ]),
            const SizedBox(height: 20),
            _buildStep("4. Review Cart", [
              "Access your cart to review all selected items.",
              "Adjust quantities or remove items as needed.",
              "Check the total cost including taxes and shipping."
            ]),
            const SizedBox(height: 20),
            _buildStep("5. Checkout", [
              "Click on 'Checkout' to begin the purchasing process.",
              "Enter your shipping address or select a saved address.",
              "Choose your preferred shipping method based on speed and cost.",
              "Enter payment details or select a saved payment method.",
              "Review your order summary, including items, shipping address, and payment details.",
              "Click 'Place Order' to complete the purchase."
            ]),
            const SizedBox(height: 20),
            _buildStep("6. Confirmation", [
              "Receive an order confirmation via email or in-app notification with details of your purchase.",
              "Use the provided tracking number or link to track the status of your shipment."
            ]),
            const SizedBox(height: 20),
            _buildStep("7. Post-Purchase Actions", [
              "Access your order history to view past purchases and order status.",
              "Review the return and exchange policy if you need to return or exchange an item.",
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
