import 'package:flutter/material.dart';
import 'package:weather_app/core/services/weather_service.dart';
import 'package:weather_app/models/weather_model.dart';

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
}
