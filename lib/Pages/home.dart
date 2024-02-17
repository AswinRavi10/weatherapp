

// import 'package:flutter/material.dart';
// import 'package:weather_app/Models/weather_model.dart';
// import 'package:weather_app/Services/weather_services.dart';

// class WeatherApp extends StatefulWidget {
//   const WeatherApp({super.key});

//   @override
//   State<WeatherApp> createState() => _WeatherAppState();
// }

// class _WeatherAppState extends State<WeatherApp> {
//   final _weatherservice =  WeatherServices( apiKey: 'e22eec4cf228d66be5e8d785ec0feaad');
//   Weather? weather;

//   fetchData()async{
//     String cityname =await _weatherservice.getCurrentCity();

//     try{
//       final fetchedweather = await _weatherservice.getWeather(cityname);
//       setState(() {
//         weather = fetchedweather;
//       });
//     }catch(e){
//       debugPrint("$e");
//     }

//   }
//   @override
//   void initState() {

//     super.initState();
//     fetchData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
          
//           Text(weather?.cityname??"Loading city"),
//           Text(weather?.temperature.toString()??"loading temp")
//           //Text("${weather != null ? double.tryParse(weather!.temperature ?? '')?.round().toString() ?? '' : 'loading temp'}"),
//         ]),
//       ),
//     );
//   }
// }