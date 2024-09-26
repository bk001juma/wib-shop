import 'package:flutter/material.dart';

class SecurityPrivacyGuideScreen extends StatelessWidget {
  const SecurityPrivacyGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Security & Privacy Guide"),
        backgroundColor: const Color.fromARGB(255, 238, 200, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Security & Privacy Best Practices",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildStep("1. Protecting Your Account", [
              "Use strong, unique passwords for your account and update them regularly.",
              "Enable two-factor authentication (2FA) to add an extra layer of security.",
              "Avoid using easily guessable information like birthdays or common words."
            ]),
            const SizedBox(height: 20),
            _buildStep("2. Recognizing and Avoiding Phishing Scams", [
              "Be cautious of unsolicited emails or messages asking for personal information.",
              "Verify the source of emails or messages by checking email addresses and URLs.",
              "Avoid clicking on links or downloading attachments from unknown sources."
            ]),
            const SizedBox(height: 20),
            _buildStep("3. Securing Your Devices", [
              "Install antivirus software and keep it up to date.",
              "Use a screen lock or password on your devices to prevent unauthorized access.",
              "Ensure that your operating system and apps are updated with the latest security patches."
            ]),
            const SizedBox(height: 20),
            _buildStep("4. Managing Your Privacy Settings", [
              "Review and adjust privacy settings on your account to control what information is shared.",
              "Limit the amount of personal information shared publicly or with third parties.",
              "Regularly check app permissions and revoke access that is no longer needed."
            ]),
            const SizedBox(height: 20),
            _buildStep("5. Handling Sensitive Information", [
              "Avoid sharing sensitive information like social security numbers or bank details unless necessary and through secure channels.",
              "Use encrypted communication methods when discussing sensitive matters.",
              "Ensure that sensitive information is not stored in unsecured locations."
            ]),
            const SizedBox(height: 20),
            _buildStep("6. Understanding Data Protection Laws", [
              "Familiarize yourself with data protection laws such as GDPR or CCPA that may apply to your region.",
              "Know your rights regarding the collection, use, and deletion of your personal data.",
              "Contact support for questions or concerns about data protection practices."
            ]),
            const SizedBox(height: 20),
            _buildStep("7. Reporting Security Issues", [
              "Report any suspicious activity or potential security breaches to the platform immediately.",
              "Use the designated channels for reporting issues to ensure they are addressed promptly.",
              "Follow up on your reports to ensure that appropriate actions have been taken."
            ]),
            const SizedBox(height: 20),
            _buildStep("8. Keeping Your Account Information Up to Date", [
              "Regularly update your account information to reflect any changes in your contact details.",
              "Ensure that your recovery options, such as backup email or phone number, are current and accessible."
            ]),
            const SizedBox(height: 20),
            _buildStep("9. Using Secure Networks", [
              "Avoid using public Wi-Fi networks for sensitive transactions or accessing your account.",
              "Use a virtual private network (VPN) to secure your internet connection when using public networks."
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
