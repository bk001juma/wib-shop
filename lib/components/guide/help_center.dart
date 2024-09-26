import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
        backgroundColor: Color.fromARGB(255, 238, 200, 245),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.question_answer, color: Colors.purple),
            title: Text("How to place an order?"),
            trailing: Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpDetailPage(
                    title: "How to place an order?",
                    content: " ...",
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment, color: Colors.purple),
            title: Text("Payment methods"),
            trailing: Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpDetailPage(
                    title: "Payment methods",
                    content: " ...",
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.local_shipping, color: Colors.purple),
            title: Text("Shipping information"),
            trailing: Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpDetailPage(
                    title: "Shipping information",
                    content: "...",
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.replay, color: Colors.purple),
            title: Text("Return & refund policy"),
            trailing: Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpDetailPage(
                    title: "Return & refund policy",
                    content: "...",
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.contact_support, color: Colors.purple),
            title: Text("Contact support"),
            trailing: Icon(Icons.chevron_right, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpDetailPage(
                    title: "Contact support",
                    content: " ...",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HelpDetailPage extends StatelessWidget {
  final String title;
  final String content;

  const HelpDetailPage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 238, 200, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          content,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
