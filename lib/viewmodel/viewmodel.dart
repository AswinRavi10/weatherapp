import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_services.dart';

class WeatherViewModel with ChangeNotifier {
  final Weatherservice _weatherService;
  Weather? _weather;

  WeatherViewModel({required Weatherservice weatherService})
      : _weatherService = weatherService;

  Weather? get weather => _weather;

  Future<void> fetchWeather() async {
    try {
      final cityName = await _weatherService.getCurrentcity();
      debugPrint("Current city: $cityName");
      final fetchedWeather = await _weatherService.getWeather(cityName);
      _weather = fetchedWeather;
      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching weather: $e");
    }
  }
}
