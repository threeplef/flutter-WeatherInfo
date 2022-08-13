import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/%20model/weather.dart';
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
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: viewModel.weatherList.map((Weather weatherList) {
                  return Column(
                    children: [
                      Text(viewModel.name),
                      Text(viewModel.getWeatherIcon(weatherList.id)),
                      Text('Current : ${viewModel.getCurrentTemp()}°'),
                      Text(weatherList.main),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('High : ${viewModel.getMaxTemp()}°'),
                          const SizedBox(width: 10),
                          Text('Low : ${viewModel.getMinTemp()}°'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(weatherList.description),
                      Text('${viewModel.getMessage(viewModel.temp())} in ${viewModel.name}!'),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}