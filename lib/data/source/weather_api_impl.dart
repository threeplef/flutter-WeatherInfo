import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather/data/%20model/weather_dto.dart';
import 'package:weather/data/source/weather_api.dart';

class WeatherApiImpl implements WeatherApi {
  final http.Client _client;

  WeatherApiImpl({http.Client? client}) : _client = (client ?? http.Client());

  @override
  Future<WeatherDto> getWeather(String query) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=95114a1e948559e010396b4debdf1672');
    http.Response response = await _client.get(url);

    String jsonString = response.body;
    Map<String, dynamic> json = jsonDecode(jsonString);
    return WeatherDto.fromJson(json);
  }
}