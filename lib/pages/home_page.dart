import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ! body config
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_splash.png'),
              fit: BoxFit.cover),
        ),
      ),

      //! Navigation Bar
      bottomNavigationBar: CrystalNavigationBar(
        // ? Indexing page
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        // ? navbar config
        backgroundColor: Colors.blue.withOpacity(0.3),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,

        // ? navbar items
        items: [
          CrystalNavigationBarItem(
            icon: Icons.home_outlined,
          ),
          CrystalNavigationBarItem(
            icon: Icons.person_outline,
          ),
          CrystalNavigationBarItem(
            icon: Icons.contacts_outlined,
          ),
          CrystalNavigationBarItem(
            icon: Icons.calculate_outlined,
          ),
          CrystalNavigationBarItem(
            icon: Icons.article_outlined,
          ),
        ],
      ),
    );
  }
}
