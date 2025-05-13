class HourlyWeatherModels {
  final DateTime dateTime;
  final double temperature;
  final String description;
  final String icon;

  HourlyWeatherModels({
    required this.dateTime,
    required this.temperature,
    required this.description,
    required this.icon,
  });

  factory HourlyWeatherModels.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModels(
      dateTime: DateTime.parse(json['dt_txt']),
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
    
  }
  
}