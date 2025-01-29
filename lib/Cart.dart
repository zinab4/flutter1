import 'package:flutter/material.dart';
import 'package:flutter1/MyWidget.dart';  // Import MyWidget

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int iceCreamCounter = 2; // Product count in the cart
  int donutCounter = 3;
  int cakeCounter = 1;

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
                  // Title section (Cart title)
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.05),
                    child: Text(
                      'Your Cart',
                      style: TextStyle(
                        color: Color.fromARGB(255, 226, 154, 188),
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Cart item list section
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    child: Column(
                      children: [
                        _buildCartItem(
                          imagePath: "assets/image/ice_cream.png",
                          productName: "Ice Cream",
                          counter: iceCreamCounter,
                          onAdd: () {
                            setState(() {
                              iceCreamCounter++;
                            });
                          },
                          onRemove: () {
                            setState(() {
                              if (iceCreamCounter > 0) iceCreamCounter--;
                            });
                          },
                          screenWidth: screenWidth,
                        ),
                        _buildCartItem(
                          imagePath: "assets/image/donut.png",
                          productName: "Donut",
                          counter: donutCounter,
                          onAdd: () {
                            setState(() {
                              donutCounter++;
                            });
                          },
                          onRemove: () {
                            setState(() {
                              if (donutCounter > 0) donutCounter--;
                            });
                          },
                          screenWidth: screenWidth,
                        ),
                        _buildCartItem(
                          imagePath: "assets/image/ice_cream.png",
                          productName: "Cake",
                          counter: cakeCounter,
                          onAdd: () {
                            setState(() {
                              cakeCounter++;
                            });
                          },
                          onRemove: () {
                            setState(() {
                              if (cakeCounter > 0) cakeCounter--;
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

          // Checkout button at the bottom
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            child: ElevatedButton(
              onPressed: () {
                // Add action for the button, like navigating to the payment page
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Proceeding to Checkout')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 226, 154, 188),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.06,
                ),
              ),
            ),
          ),

          // Adding MyWidget at the bottom of Checkout button
          MyWidget(screenHeight: screenHeight), // MyWidget here
        ],
      ),
    );
  }

  // Widget to build cart item rows with add and remove buttons
  Widget _buildCartItem({
    required String imagePath,
    required String productName,
    required int counter,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
    required double screenWidth,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth * 0.18,
            height: screenWidth * 0.18,
            child: Image.asset(imagePath),
          ),
          SizedBox(width: 10),
          Text(
            productName,
            style: TextStyle(
              color: Color.fromARGB(255, 226, 154, 188),
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: Colors.white),
                onPressed: onRemove,
                color: Color.fromARGB(255, 226, 154, 188),
              ),
              Text(
                '$counter',
                style: TextStyle(
                  color: Color.fromARGB(255, 226, 154, 188),
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: onAdd,
                color: Color.fromARGB(255, 226, 154, 188),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: CartScreen(),
      debugShowCheckedModeBanner: false,
    ));


