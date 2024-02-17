// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:geocoding/geocoding.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:weather_app/Models/weather_model.dart';
// // import 'package:geolocator/geolocator.dart';

// // class WeatherServices {
// //   final baseUrl = "https://api.openweathermap.org/data/2.5/weather";
// //   final String? apiKey;

// //   WeatherServices( { required this.apiKey});

// //   Future<Weather> getWeather(String cityname) async {
// //   final response = await http.get(Uri.parse("$baseUrl?q=$cityname&appid=$apiKey&units=metric"));

// //   if (response.statusCode == 200) {
// //    debugPrint("Response Body: ${response.body}"); // Add this line to print response body
// //     return Weather.fromJson(jsonDecode(response.body));
// //   } else {
// //     throw Exception("Failed to load Weather data");
// //   }
// // }

// //   Future<String> getCurrentCity() async {
// //     LocationPermission permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //     }
// //     Position position = await Geolocator.getCurrentPosition(
// //       desiredAccuracy: LocationAccuracy.high,
// //     );
// //     List<Placemark> placemarks = await placemarkFromCoordinates(
// //       position.latitude,
// //       position.longitude,
// //     );
// //     String currentCity = placemarks.first.locality ?? "Unknown";
// //     return currentCity;
// //   }
// // }
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:http/http.dart' as http;
// import 'package:weather_app/Models/weather_model.dart';
// import 'package:geolocator/geolocator.dart';

// class WeatherServices {
//   final baseUrl = "https://api.openweathermap.org/data/2.5/weather";
//   final String? apiKey;

//   WeatherServices({required this.apiKey});

//   Future<Weather> getWeather(String cityname) async {
//     final response = await http.get(Uri.parse("$baseUrl?q=$cityname&appid=$apiKey&units=metric"));

//     if (response.statusCode == 200) {
//       debugPrint("Response Body: ${response.body}");
//       return Weather.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception("Failed to load Weather data: ${response.statusCode}");
//     }
//   }

//   Future<String> getCurrentCity() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//     String currentCity = placemarks.first.locality ?? "Unknown";
//     return currentCity;
//   }
// }


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Models/weather_model.dart';

import 'package:http/http.dart' as http;

class Weatherservice {
  final String apiKey;

  Weatherservice(this.apiKey, );
  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'));
        debugPrint("...............${response.body}");
        
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to get weather");
    }
  }

  Future<String> getCurrentcity() async {
    // get permission from user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // fetch current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // convert the location into list of placemark objects
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // name of city
    String? city = placemark.first.country;
    return city??"";
}
}