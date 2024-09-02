import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 238, 200, 245),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            // Profile picture with update icon
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("asset/images/baraka.jpg"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Handle image update
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Name label and holder
            Text(
              'Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Space between label and holder
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  'Barack', // Replace with dynamic name if needed
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(height: 18),
            // Phone Number label and holder
            Text(
              "Phone Number",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  '+255', // Replace with dynamic name if needed
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(height: 18),
            // Email label and holder
            Text(
              "Email",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  'eg@gmail.com', // Replace with dynamic name if needed
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(height: 18),
            // Country label and holder
            Text(
              "Country",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  'Tanzania', // Replace with dynamic name if needed
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(height: 18),
            // Address label and holder
            Text(
              "Address",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  'Mpanda', // Replace with dynamic name if needed
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(height: 20),
            // Update button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle update action
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  backgroundColor: Color.fromARGB(255, 77, 4, 90),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text('Update Profile'),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
