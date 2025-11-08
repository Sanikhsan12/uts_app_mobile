import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/weather_model.dart';

class WeatherService {
  // ! base url dan api key
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String _apiKey =
      dotenv.env['OPENWEATHER_API_KEY'] ?? 'API_KEY_NOT_FOUND';

  Future<WeatherModel?> fetchWeather(String cityName) async {
    final Uri url =
        Uri.parse('$_baseUrl?q=$cityName&appid=$_apiKey&units=metric&lang=id');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        throw Exception('Gagal memuat data cuaca: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gagal Terhubung ke Server: $e');
    }
  }
}
