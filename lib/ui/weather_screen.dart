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
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeatherScreenViewModel>();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        viewModel.fetchWeatherLists(_textController.text);
                        _textController.clear();
                      });
                    },
                    child: const Icon(Icons.search),
                  ),
                  hintText: '검색',
                  hintStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  contentPadding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: viewModel.weatherList.map((Weather weatherList) {
                  return Column(
                    children: [
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