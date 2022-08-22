import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/color_schemes.g.dart';
import 'package:weather/data/repository/weather_screen_repository.dart';
import 'package:weather/ui/weather_screen.dart';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Theme.of(context).colorScheme == lightColorScheme
                  ? const AssetImage('lib/assets/background_light.png')
                  : const AssetImage('lib/assets/background_dark.png'),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 250, 20, 30),
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
                        fontSize: 18, fontWeight: FontWeight.bold),
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
                    MaterialPageRoute(
                        builder: (context) => const WeatherScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primaryContainer,
                    elevation: 0),
                child: Text(
                  '🌈 Show Weather',
                  style: Theme.of(context).colorScheme == lightColorScheme
                      ? const TextStyle(color: Colors.black)
                      : const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
