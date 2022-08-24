import 'package:weather/data/%20model/weather.dart';
import 'package:weather/data/source/weather_source.dart';

class WeatherRepository {
  final WeatherApi _api;

  WeatherRepository(this._api);

  Future<Weather> getWeather(String query) async {
    final weatherDto = await _api.getWeather(query);

    return Weather(
      name: weatherDto.name ?? '',
      id: weatherDto.weather?.elementAt(0).id ?? 0,
      main: weatherDto.weather?.elementAt(0).main ?? '',
      description: weatherDto.weather?.elementAt(0).description ?? '',
      temp: weatherDto.main?.temp ?? 0,
      maxTemp: weatherDto.main?.tempMax ?? 0,
      minTemp: weatherDto.main?.tempMin ?? 0
    );
  }
}