import 'dart:async';
import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:intl/intl.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  ! Variable untuk Time State
  int currentIndex = 0;
  late DateTime now;
  Timer? timer;

  // ! Variable untuk API
  final WeatherService weatherService = WeatherService();
  late Future<WeatherModel?> weatherData;

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
    weatherData = weatherService.fetchWeather('Bandung');
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

        //! Display
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ! Display Cuaca
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: builderWeatherDisplay(),
                ),

                const SizedBox(height: 30),

                // ! Display Cuaca Dan Tanggal
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

  // ! Widget menampilkan data cuaca
  Widget builderWeatherDisplay() {
    return FutureBuilder<WeatherModel?>(
      future: weatherData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          final weather = snapshot.data!;
          return Column(
            children: [
              Text(
                weather.cityName,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${weather.temperature} °C',
                style: const TextStyle(
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 10),
              Image.network(
                'http://openweathermap.org/img/wn/${weather.icon}.png',
              ),
              const SizedBox(height: 10),
              Text(
                weather.weatherCondition,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
