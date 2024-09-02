// lib/components/screens/account_management_screen.dart

import 'package:flutter/material.dart';

class AccountManagementScreen extends StatelessWidget {
  const AccountManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Management"),
        backgroundColor: const Color.fromARGB(255, 238, 200, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Account Management Guide",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildStep("1. Create an Account", [
              "Click on the 'Sign Up' button to create a new account.",
              "Provide essential information such as name, email address, and password.",
              "Confirm your email address by clicking on the verification link sent to your inbox.",
              "Complete additional profile information such as phone number and address."
            ]),
            const SizedBox(height: 20),
            _buildStep("2. Log In", [
              "Input your registered email address and password.",
              "Use the 'Forgot Password' link to reset your password if needed.",
              "Enable two-factor authentication (2FA) for enhanced security."
            ]),
            const SizedBox(height: 20),
            _buildStep("3. Manage Profile", [
              "Edit personal details such as name, email, phone number, and address.",
              "Update your password to maintain account security.",
              "Upload or change your profile picture."
            ]),
            const SizedBox(height: 20),
            _buildStep("4. View Order History", [
              "Navigate to the order history section to view past purchases.",
              "Check details of individual orders including status, items purchased, and shipping information.",
              "Monitor the status of current orders using tracking numbers."
            ]),
            const SizedBox(height: 20),
            _buildStep("5. Manage Payment Methods", [
              "Enter new payment details such as credit/debit card information.",
              "Update or remove existing payment methods.",
              "Choose a default payment method for quicker checkout."
            ]),
            const SizedBox(height: 20),
            _buildStep("6. Manage Addresses", [
              "Enter new shipping addresses for deliveries.",
              "Update existing addresses for accuracy.",
              "Choose a default shipping address for convenience."
            ]),
            const SizedBox(height: 20),
            _buildStep("7. Manage Notifications", [
              "Set preferences for receiving notifications such as order updates and promotional offers.",
              "Opt-in or out of email notifications based on your preferences."
            ]),
            const SizedBox(height: 20),
            _buildStep("8. Privacy and Security Settings", [
              "Adjust privacy settings to control who can see your information.",
              "Enable or configure additional security features such as 2FA or account recovery options."
            ]),
            const SizedBox(height: 20),
            _buildStep("9. Deactivate or Delete Account", [
              "Temporarily disable your account if you need a break from the platform.",
              "Permanently delete your account and all associated data. Ensure to provide clear warnings about data loss."
            ]),
            const SizedBox(height: 20),
            _buildStep("10. Contact Support", [
              "Reach out to customer support for assistance with account-related issues.",
              "Use forms or contact options to submit specific account-related queries or problems."
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
