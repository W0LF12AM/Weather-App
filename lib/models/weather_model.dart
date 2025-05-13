class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final String countryCode;
  final double windSpeed;
  final int humidity;
  final int sunHours;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.countryCode,
    required this.windSpeed,
    required this.humidity,
    required this.sunHours,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final sunrise = json['sys']['sunrise'];
    final sunset = json['sys']['sunset'];
    final sunDuration = ((sunset - sunrise) / 3600).floor(); 

    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      countryCode: json['sys']['country'],
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
      sunHours: sunDuration,
    );
  }
}
