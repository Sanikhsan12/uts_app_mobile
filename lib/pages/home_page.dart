import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

// * Pages
import './weather_page.dart';
import './calculator_page.dart';
import './contact_page.dart';
import './biodata_page.dart';
import 'news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  ! Variable untuk Time State
  int currentIndex = 0;

  //  ! List and auto indexing of Pages
  final List<Widget> pages = const [
    WeatherPage(),
    BiodataPage(),
    ContactPage(),
    CalculatorPage(),
    NewsPage(),
  ];

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
        child: IndexedStack(
          index: currentIndex,
          children: pages,
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
