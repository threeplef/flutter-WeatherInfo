import 'package:weather/data/%20model/weather_dto.dart';

abstract class WeatherApi {
  Future<WeatherDto> getWeather(String query);
}