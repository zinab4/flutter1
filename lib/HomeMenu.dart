import 'package:flutter/material.dart';
import 'package:flutter1/MyWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int iceCreamCounter = 0;
  int donutCounter = 0;
  int cakeCounter = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top Section (Menu Title)
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.05),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Color.fromARGB(255, 226, 154, 188),
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Search Bar Section
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.03,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 226, 154, 188),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search Menu',
                          hintStyle: TextStyle(color: Colors.white70),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Icon Grid Section with individual counters
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildProductCard(
                          imagePath: "assets/image/ice_cream.png",
                          counter: iceCreamCounter,
                          onAdd: () {
                            setState(() {
                              iceCreamCounter++;
                            });
                          },
                          screenWidth: screenWidth,
                        ),
                        _buildProductCard(
                          imagePath: "assets/image/donut.png",
                          counter: donutCounter,
                          onAdd: () {
                            setState(() {
                              donutCounter++;
                            });
                          },
                          screenWidth: screenWidth,
                        ),
                        _buildProductCard(
                          imagePath: "assets/image/ice_cream.png",
                          counter: cakeCounter,
                          onAdd: () {
                            setState(() {
                              cakeCounter++;
                            });
                          },
                          screenWidth: screenWidth,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          MyWidget(screenHeight: screenHeight),
        ],
      ),
    );
  }

  // Widget to build product cards with counters
  Widget _buildProductCard({
    required String imagePath,
    required int counter,
    required VoidCallback onAdd,
    required double screenWidth,
  }) {
    return Column(
      children: [
        SizedBox(
          width: screenWidth * 0.18,
          height: screenWidth * 0.18,
          child: Image.asset(imagePath),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: TextStyle(
                color: Color.fromARGB(255, 226, 154, 188),
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: onAdd,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 226, 154, 188),
                shape: CircleBorder(),
                padding: EdgeInsets.all(5),
                minimumSize: Size(32, 32),
              ),
              child: Icon(Icons.add, color: Colors.white, size: 16),
            ),
          ],
        ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    ));




