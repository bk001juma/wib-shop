import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var defaultPadding = 16.0; // Changed to double for consistency
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding), // Fixed padding
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Dashboard",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ]),
            Spacer(
              flex: 2,
            ),
            Flexible(
              // Changed to Flexible
              child: SearchField(),
            ),
            AdmimProfile(defaultPadding: defaultPadding),
          ],
        ),
        // Add more widgets here, e.g., cards, lists, etc.
      ),
    );
  }
}

class AdmimProfile extends StatelessWidget {
  const AdmimProfile({
    super.key,
    required this.defaultPadding,
  });

  final double defaultPadding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 12)),
        Image.asset("asset/images/baraka.jpg", height: 38),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Text("Barack"),
        ),
        Icon(Icons.keyboard_arrow_down),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.grey,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {
            // Add search action here
          },
          child: Icon(
            Icons.search,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
