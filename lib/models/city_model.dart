class CityModel {
  final String name;
  final String country;
  final double latitude;
  final double longitude;

  CityModel({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        name: json['name'],
        country: json['country'],
        latitude: (json['lat'] as num).toDouble(),
        longitude: (json['lon'] as num).toDouble());
  }
}
