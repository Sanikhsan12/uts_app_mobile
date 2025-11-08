import 'dart:async';
import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late DateTime now;
  Timer? timer;

  // ! inisialisasi waktu
  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  // ! dispose timer
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ! format waktu
    String formattedTime = DateFormat.Hms('id_ID').format(now);
    String formattedDate = DateFormat.yMMMMEEEEd('id_ID').format(now);

    return Scaffold(
      // ! body config
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_splash.png'),
              fit: BoxFit.cover),
        ),

        //! Display waktu dan tanggal
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.values[1],
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        formattedTime,
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
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
