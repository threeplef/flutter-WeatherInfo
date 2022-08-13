import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/%20model/weather.dart';

class WeatherApi {

  Future<String> getName(String query) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=b96c1cb9a29e01ca3542de12f1528017');
    http.Response response = await http.get(url);
    String jsonString = response.body;
    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['name'] == null) {
      return '';
    }
    String name = json['name'] as String;
    return name;
  }

  Future<List<Weather>> getWeather(String query) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=b96c1cb9a29e01ca3542de12f1528017');

    http.Response response = await http.get(url);
    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['weather'] == null) {
      return List.empty();
    }
    Iterable weather = json['weather'];
    return weather.map((e) => Weather.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>> getTemp(String query) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=b96c1cb9a29e01ca3542de12f1528017');

    http.Response response = await http.get(url);
    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['main'] == null) {
      return {};
    }
    Map<String, dynamic> temperature = json['main'];
    return temperature;
  }
}