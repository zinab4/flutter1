import 'package:flutter/material.dart';
import 'package:flutter1/MyWidget.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String userName = "Name"; 
  final String userEmail = "Name@gmail.com";
  final String userPhone = "+0123456789";

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 170, 211, 245), // Start color
              const Color.fromARGB(255, 226, 154, 188), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title Text
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Name Display
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 154, 188),
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  child: Text(
                    userName,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                // Email Display
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 154, 188),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    userEmail,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                // Phone Display
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 154, 188),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    userPhone,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                // Back to Home Button
                GestureDetector(
                  onTap: () {
                    // Navigate back to the previous screen (e.g., login or home)
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back to Home',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: screenHeight * 0.1), // Just to add space before MyWidget
              ],
            ),
          ),
        ),
      ),
      // إضافة MyWidget لشريط التنقل السفلي
      bottomNavigationBar: MyWidget(screenHeight: screenHeight),
    );
  }
}
