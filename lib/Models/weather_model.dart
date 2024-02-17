class Weather {
  final String cityname;
  final double temperature;


  Weather( {required this.cityname, required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(

      cityname: json['name'],
      
      temperature: json['main']['temp'].toDouble(),
      
    );
  }
}
