import 'package:flutter/material.dart';

class ShippingDeliveryGuideScreen extends StatelessWidget {
  const ShippingDeliveryGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping & Delivery Guide"),
        backgroundColor: const Color.fromARGB(255, 238, 200, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Shipping & Delivery Information",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildStep("1. Shipping Options", [
              "Learn about the different shipping methods available.",
              "Understand the costs and delivery times for each option."
            ]),
            const SizedBox(height: 20),
            _buildStep("2. Shipping Costs and Rates", [
              "Understand how shipping fees are calculated.",
              "Check shipping costs before finalizing your purchase."
            ]),
            const SizedBox(height: 20),
            _buildStep("3. Packaging and Labeling", [
              "Ensure proper packaging and labeling of items.",
              "Handle special items with care."
            ]),
            const SizedBox(height: 20),
            _buildStep("4. Shipping Process", [
              "Follow the process from order confirmation to shipment.",
              "Update order status and provide tracking information."
            ]),
            const SizedBox(height: 20),
            _buildStep("5. Delivery Times and Expectations", [
              "Review estimated delivery times and be aware of potential delays.",
              "Communicate with sellers if there are issues."
            ]),
            const SizedBox(height: 20),
            _buildStep("6. Handling Delivery Issues", [
              "Report any issues with delivery to customer support.",
              "Follow the return or exchange process if needed."
            ]),
            const SizedBox(height: 20),
            _buildStep("7. Returns and Exchanges", [
              "Understand the return policy and process.",
              "Prepare items for return or exchange."
            ]),
            const SizedBox(height: 20),
            _buildStep("8. International Shipping Considerations", [
              "Be aware of customs fees and international regulations.",
              "Understand the impact on delivery times."
            ]),
            const SizedBox(height: 20),
            _buildStep("9. Tracking and Notifications", [
              "Use tracking numbers to monitor your shipment.",
              "Receive notifications about shipping status and delivery."
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
