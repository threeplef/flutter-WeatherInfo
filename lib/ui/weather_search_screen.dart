import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/ui/weather_screen.dart';
import 'package:weather/view_model/weather_screen_view_model.dart';

class WeatherSearchScreen extends StatefulWidget {
  const WeatherSearchScreen({Key? key}) : super(key: key);

  @override
  State<WeatherSearchScreen> createState() => _WeatherSearchScreenState();
}

class _WeatherSearchScreenState extends State<WeatherSearchScreen> {
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
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: TextField(
                controller: _textController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Enter your city',
                  hintStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  contentPadding: const EdgeInsets.all(0),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  viewModel.fetchWeatherLists(_textController.text);
                  _textController.clear();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeatherScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple, elevation: 0),
              child: const Text('Show Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
