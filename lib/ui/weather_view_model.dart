import 'package:flutter/material.dart';
import 'package:weather/data/%20model/weather.dart';
import 'package:weather/data/repository/weather_repository.dart';
import 'package:weather/data/source/weather_api_impl.dart';

class WeatherScreenViewModel extends ChangeNotifier {
  final _weatherRepository = WeatherRepository(WeatherApiImpl());

  Weather myWeather = const Weather(
    name: '',
    id: 0,
    main: '',
    description: '',
    temp: 0,
    maxTemp: 0,
    minTemp: 0,
  );
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
      return 'โ๏ธ';
    } else if (id == 800) {
      return 'โ๏ธ';
    } else if (id > 700) {
      return '๐ซ';
    } else if (id >= 600) {
      return 'โ๏ธ';
    } else if (id >= 500) {
      return 'โ๏ธ';
    } else if (id >= 300) {
      return '๐ง';
    } else if (id >= 200) {
      return '๐ฉ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(num temp) {
    if (temp > 27) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 23) {
      return 'Time for ๐ฉณ and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}