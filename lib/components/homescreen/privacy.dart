// ignore: file_names
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: Color.fromARGB(255, 238, 200, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 16),
            Text(
              'Effective Date: 13-08-2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16),
            Text(
              '1. Introduction',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to WIBSHOP. We value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our application. Please read this Privacy Policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the application.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Information We Collect',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 8),
            Text(
              'We may collect and process the following types of information:\n\n'
              '- Personal Identification Information: Name, email address, phone number, and payment information.\n'
              '- Transaction Data: Details of purchases and sales made through the application.\n'
              '- Usage Data: Information about how you use the application, including your IP address, browser type, and operating system.\n'
              '- Communication Data: Any communications between you and us, including customer support inquiries.',
            ),
            SizedBox(height: 16),
            Text(
              '3. How We Use Your Information',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 8),
            Text(
              'We use the information we collect to:\n\n'
              '- Provide and manage the application and its features.\n'
              '- Process transactions and fulfill orders.\n'
              '- Improve our application and services.\n'
              '- Communicate with you, including sending promotional materials and updates.\n'
              '- Respond to your inquiries and provide customer support.\n'
              '- Ensure the security and integrity of our application.',
            ),
            SizedBox(height: 16),
            Text(
              '4. Sharing Your Information',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 8),
            Text(
              'We may share your information with:\n\n'
              '- Service Providers: Third-party vendors who assist us in operating our application, such as payment processors and delivery services.\n'
              '- Business Transfers: If we are involved in a merger, acquisition, or asset sale, your information may be transferred as part of the transaction.\n'
              '- Legal Requirements: If required by law or to protect our rights, we may disclose your information to comply with legal obligations or enforce our terms of service.',
            ),
            SizedBox(height: 16),
            Text(
              '5. Security of Your Information',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 8),
            Text(
              'We implement appropriate technical and organizational measures to safeguard your personal information. However, no method of transmission over the internet or method of electronic storage is completely secure. While we strive to protect your information, we cannot guarantee its absolute security.',
            ),
            SizedBox(height: 16),
            Text(
              '6. Your Rights',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 8),
            Text(
              'You have the right to:\n\n'
              '- Access and update your personal information.\n'
              '- Request the deletion of your personal information.\n'
              '- Object to or restrict the processing of your personal information.\n'
              '- Withdraw your consent where we rely on consent for processing.\n\n'
              'To exercise these rights, please contact us using the information provided below.',
            ),
            SizedBox(height: 16),
            Text(
              '7. Changes to This Privacy Policy',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 8),
            Text(
              'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the effective date. You are advised to review this Privacy Policy periodically for any changes.',
            ),
            SizedBox(height: 16),
            Text(
              '8. Contact Us',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions or concerns about this Privacy Policy, please contact us at:\n\n'
              'Email: juannabarack001@gmail.com\n'
              'Phone: 0675018671\n',
            ),
          ],
        ),
      ),
    );
  }
}
