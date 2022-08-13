import 'package:flutter/material.dart';
import 'package:weather/%20model/weather.dart';
import 'package:weather/api/weather_api.dart';

class WeatherScreenViewModel extends ChangeNotifier {
  final _weatherApi = WeatherApi();

  List<Weather> weatherList = [];
  Map<String, dynamic> tempList = {};
  List<String> temp = [];
  String name = '';

  void fetchWeatherLists(String query) async {
    weatherList = await _weatherApi.getWeather(query);
    tempList = await _weatherApi.getTemp(query);
    temp = tempList.keys.toList();
    name = await _weatherApi.getName(query);
    notifyListeners();
  }

  num kToC(num K) {
    num C = K - 273.15;
    return C;
  }

  String getCurrentTemp() {
    return kToC(tempList[temp[0]]).toStringAsFixed(1);
  }

  String getMinTemp() {
    return kToC(tempList[temp[2]]).toStringAsFixed(1);
  }

  String getMaxTemp() {
    return kToC(tempList[temp[3]]).toStringAsFixed(1);
  }
}