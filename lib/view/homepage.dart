import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/viewmodel/viewmodel.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = Provider.of<WeatherViewModel>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weatherViewModel.weather?.cityname ?? "Loading city"),
            Text(weatherViewModel.weather?.temperature.toString() ?? "Loading temperature"),
            ElevatedButton(
              onPressed: () => weatherViewModel.fetchWeather(),
              child: Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
