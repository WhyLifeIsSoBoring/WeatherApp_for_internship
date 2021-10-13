class CurrentWeather {
  final String city;
  final String country;
  final double temp;
  final String main;
  final double pop;
  final double rainVolume;
  final double pressure;
  final double windSpeed;
  final double windDeg;

  CurrentWeather({required this.city, required this.country, required this.temp, required this.main, required this.pop, required this.rainVolume, required this.pressure, required this.windSpeed, required this.windDeg});
  
  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      city: json['city'][0]['name'],
      country: json['city'][0]['country'],
      temp: json['main']['temp'].toDouble(),
      main: json['weather'][0]['main'],
      pop: json['pop'].toDouble(),
      rainVolume: json['rain']['3h'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      windDeg: json['wind']['deg'].toDouble(),
    );
  }
}