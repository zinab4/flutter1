import 'package:flutter/material.dart';
import 'package:flutter1/Cart.dart';
import 'package:flutter1/HomeMenu.dart';
import 'package:flutter1/profile.dart';

class MyWidget extends StatelessWidget {
  final double screenHeight;

  const MyWidget({Key? key, required this.screenHeight}) : super(key: key);

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Widget _buildBottomNavIcon(
      IconData icon, String label, BuildContext context, Widget destinationPage) {
    return GestureDetector(
      onTap: () => _navigateToPage(context, destinationPage),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
      color: const Color.fromARGB(255, 226, 154, 188),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavIcon(Icons.home, 'Home', context, HomeScreen()),
          _buildBottomNavIcon(Icons.person, 'Profile', context, ProfileScreen()),
          _buildBottomNavIcon(Icons.shopping_cart, 'Cart', context, CartScreen()),
          _buildBottomNavIcon(Icons.favorite_border, 'Favorites', context, FavoritesPage()),
        ],
      ),
    );
  }
}

// Example pages for navigation
class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('HomeMenuPage')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('ProfilePage')),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Center(child: Text('Cart')),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: Center(child: Text('FavoritesPage')),
    );
  }
}

