import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/core/services/weather_service.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/models/loc_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/models/hourly_weather_models.dart';
import 'package:http/http.dart' as http;

final Map<String, String> countryNames = {
  'ID': 'Indonesia',
  'US': 'United States',
  'GB': 'United Kingdom',
  'FR': 'France',
  'DE': 'Germany',
  'IT': 'Italy',
  'JP': 'Japan',
  'CN': 'China',
  'KR': 'South Korea',
  'IN': 'India',
  'RU': 'Russia',
  'BR': 'Brazil',
  'CA': 'Canada',
  'AU': 'Australia',
  'ES': 'Spain',
  'MX': 'Mexico',
  'TR': 'Turkey',
  'SA': 'Saudi Arabia',
  'AE': 'United Arab Emirates',
  'TH': 'Thailand',
  'SG': 'Singapore',
  'MY': 'Malaysia',
  'PH': 'Philippines',
  'VN': 'Vietnam',
  'AR': 'Argentina',
  'ZA': 'South Africa',
  'EG': 'Egypt',
  'NG': 'Nigeria',
  'NL': 'Netherlands',
  'CH': 'Switzerland',
};

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weather;
  bool _isLoading = false;
  String? _error;

  WeatherModel? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadWeather(String cityName) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _weather = await WeatherService().fetchWeather(cityName);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchHourlyWeather(String city) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=b0b3541d1f66e99621205eba9b69be8d&units=metric');

    final response = await http.get(url);
    print('Fetching hourly weather for $city...');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['list'];

      list.take(5).forEach((item) {
        print('🔍 Hourly temp: ${item['main']['temp']} - ${item['dt_txt']}');
      });

      _hourlyWeather = list
          .take(5)
          .map((item) => HourlyWeatherModels.fromJson(item))
          .toList();

      notifyListeners();
    } else {
      throw Exception('Failed to load hourly weather data');
    }
  }

  List<HourlyWeatherModels> _hourlyWeather = [];
  List<HourlyWeatherModels> get hourlyWeather => _hourlyWeather;

  List<CityModel> _searchedCities = [];
  bool _isSearching = false;

  List<CityModel> get searchedCities => _searchedCities;
  bool get isSearching => _isSearching;

  Future<List<CityModel>> searchCities(String query) async {
    _isSearching = true;
    notifyListeners();

    List<CityModel> result = [];

    try {
      final url = Uri.parse(
          'http://api.openweathermap.org/geo/1.0/direct?q=$query&limit=5&appid=b0b3541d1f66e99621205eba9b69be8d');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        final result = data.map((item) => CityModel.fromJson(item)).toList();
        _searchedCities = result;
      } else {
        _searchedCities = [];
      }
    } catch (e) {
      _searchedCities = [];
    }
    _isSearching = false;
    notifyListeners();

    return result;
  }
}
