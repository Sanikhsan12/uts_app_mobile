import 'dart:math';

class WeatherModel {
  String cityName;
  double temperature;
  String weatherCondition;
  String icon;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
    required this.icon,
  });

  //  ! factory method untuk membuat instance dari JSON
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: roundDouble(json['main']['temp'].toDouble(), 1),
      weatherCondition: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );
  }
}

// ! Membulatkan angka desimal
double roundDouble(double value, int places) {
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
