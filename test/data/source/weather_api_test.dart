import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:weather/data/%20model/weather_dto.dart';
import 'package:weather/data/source/weather_api_impl.dart';

void main() {
  test('날씨 정보는 잘 들어와야 된다', () async {
    final mockClient = MockClient((request) async {
      if (request.url.toString() == 'https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=95114a1e948559e010396b4debdf1672') {
        return Response(fakeWeatherData, 200);
      }
      return Response('error', 404);
    });

    final api = WeatherApiImpl(client: mockClient);

    WeatherDto weather = await api.getWeather('seoul');

    expect(weather.name, 'Seoul');
    expect(weather.weather![0].main, 'Rain');
  });
}

const fakeWeatherData = """
{
  "coord": {
    "lon": 126.9778,
    "lat": 37.5683
  },
  "weather": [
    {
      "id": 500,
      "main": "Rain",
      "description": "light rain",
      "icon": "10d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 295.66,
    "feels_like": 296,
    "temp_min": 294.81,
    "temp_max": 296.84,
    "pressure": 1008,
    "humidity": 78
  },
  "visibility": 10000,
  "wind": {
    "speed": 2.06,
    "deg": 180
  },
  "rain": {
    "1h": 0.21
  },
  "clouds": {
    "all": 0
  },
  "dt": 1661386511,
  "sys": {
    "type": 1,
    "id": 8105,
    "country": "KR",
    "sunrise": 1661374569,
    "sunset": 1661422376
  },
  "timezone": 32400,
  "id": 1835848,
  "name": "Seoul",
  "cod": 200
}
""";