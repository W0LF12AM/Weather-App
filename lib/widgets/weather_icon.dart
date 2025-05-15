String getWeatherIcon(String description) {
  description = description.toLowerCase();

  if (description.contains('rain')) {
    return 'lib/assets/rain.json';
  } else if (description.contains('thunder')) {
    return 'lib/assets/thunder.json';
  } else if (description.contains('cloud') && description.contains('sun')) {
    return 'lib/assets/cloudy sun.json';
  } else if (description.contains('cloud')) {
    return 'lib/assets/cloudy.json';
  } else if (description.contains('sun') || description.contains('clear')) {
    return 'lib/assets/sun.json';
  } else {
    return 'lib/assets/cloudy.json';
  }
}

String getWeatherIconPath(String weatherMain) {
  switch (weatherMain.toLowerCase()) {
    case 'clouds':
      return 'lib/assets/cloudy.json';
    case 'few clouds':
    case 'scattered clouds':
      return 'lib/assets/cloudy sun.json';
    case 'rain':
    case 'drizzle':
      return 'lib/assets/rain.json';
    case 'clear':
    case 'sunny':
      return 'lib/assets/sun.json';
    case 'thunderstorm':
      return 'lib/assets/thunder.json';
    default:
      return 'lib/assets/cloudy.json';
  }
}
