import 'package:flutter/material.dart';
import 'package:weather/data/%20model/weather.dart';
import 'package:weather/data/repository/weather_repository.dart';
import 'package:weather/data/source/weather_source_impl.dart';

class WeatherScreenViewModel extends ChangeNotifier {
  final _weatherRepository = WeatherRepository(WeatherApiImpl());

  Weather myWeather = const Weather(
      name: '',
      id: 0,
      main: '',
      description: '',
      temp: 0,
      maxTemp: 0,
      minTemp: 0);
  bool isLoading = true;

  void fetchWeatherLists(String query) async {
    isLoading = true;
    notifyListeners();
    myWeather = await _weatherRepository.getWeather(query);
    isLoading = false;
    notifyListeners();
  }

  String convertTemp(num F) {
    return (F - 273.15).toStringAsFixed(1);
  }

  String getWeatherIcon(num id) {
    if (id > 800) {
      return '☁️';
    } else if (id == 800) {
      return '☀️';
    } else if (id > 700) {
      return '🌫';
    } else if (id >= 600) {
      return '☃️';
    } else if (id >= 500) {
      return '☔️';
    } else if (id >= 300) {
      return '🌧';
    } else if (id >= 200) {
      return '🌩';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(num temp) {
    if (temp > 27) {
      return 'It\'s 🍦 time';
    } else if (temp > 23) {
      return 'Time for 🩳 and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}