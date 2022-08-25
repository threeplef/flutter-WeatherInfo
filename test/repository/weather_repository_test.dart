import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/data/%20model/weather_dto.dart';
import 'package:weather/data/repository/weather_repository.dart';
import 'package:weather/data/source/weather_api.dart';

import '../source/weather_api_test.dart';
import 'weather_repository_test.mocks.dart';

@GenerateMocks([WeatherApi])
void main() {
  test('날씨 정보가 잘 들어와야 된다', () async {
    final api = MockWeatherApi();

    when(api.getWeather('seoul'))
        .thenAnswer((_) async => WeatherDto.fromJson(jsonDecode(fakeWeatherData)));

    final repository = WeatherRepository(api);

    final weather = await repository.getWeather('seoul');

    expect(weather.name, 'Seoul');
  });
}