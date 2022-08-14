import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/%20model/weather.dart';
import 'package:weather/color_schemes.g.dart';
import 'package:weather/view_model/weather_screen_view_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeatherScreenViewModel>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(11, 120, 11, 0),
          child: Container(
            width: 370,
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: Theme.of(context).colorScheme == lightColorScheme
                    ? const AssetImage('lib/assets/card_light.png')
                    : const AssetImage('lib/assets/card_dark.png'),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: viewModel.weatherList.map((Weather weatherList) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 53.0),
                        child: Column(
                          children: [
                            Text(
                              viewModel.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 2),
                            Text(' ${viewModel.getCurrentTemp()}°',
                                style: const TextStyle(fontSize: 25)),
                            const SizedBox(height: 15),
                            Text(weatherList.main,
                                style: const TextStyle(fontSize: 17)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${viewModel.getMaxTemp()}° / '),
                                Text('${viewModel.getMinTemp()}°'),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(viewModel.getWeatherIcon(weatherList.id),
                                style: const TextStyle(fontSize: 50)),
                            const SizedBox(height: 40),
                            Text(weatherList.description,
                                style: const TextStyle(fontSize: 15)),
                            const SizedBox(height: 40),
                            Text(
                                '${viewModel.getMessage(viewModel.temp())}\nin ${viewModel.name}!',
                                style: const TextStyle(fontSize: 15),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}