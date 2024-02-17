// import 'package:flutter/material.dart';
// import 'package:weather_app/Pages/home.dart';

// void main(){
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home:  WeatherApp(),));
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/Services/weather_services.dart';
import 'package:weather_app/view/homepage.dart';

import 'package:weather_app/viewmodel/viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherViewModel(weatherService: Weatherservice( 'e22eec4cf228d66be5e8d785ec0feaad')),
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const WeatherApp(),
      ),
    );
  }
}
