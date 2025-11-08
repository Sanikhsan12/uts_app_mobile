import 'package:flutter/material.dart';
import './pages/splash_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // ! insialisasi dan singkronisasi tanggal
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
