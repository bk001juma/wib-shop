import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
      children: [
        Expanded(
            child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              horizontalTitleGap: 0.0,
              leading: SvgPicture.asset(
                "assets/icons/menu_dashboard.svg",
                height: 16,
              ),
              title: Text(
                "Dashboard",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )),
        Expanded(
            flex: 5,
            child: Container(
              color: Colors.blue,
            ))
      ],
    )));
  }
}
