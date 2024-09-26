import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Notifications'),
              Tab(text: 'Chat'),
            ],
          ),
        ),
      ),
    );
  }
}
