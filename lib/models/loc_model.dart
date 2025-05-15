class LocModel {
  final String name;
  final String country;

  LocModel({
    required this.name,
    required this.country,
  });

  factory LocModel.fromJson(Map<String, dynamic> json) {
    return LocModel(name: json['name'], country: json['country']);
  }
}
