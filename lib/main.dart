import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/color_schemes.g.dart';
import 'package:weather/ui/weather_search_screen.dart';
import 'package:weather/view_model/weather_screen_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => WeatherScreenViewModel(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      themeMode: ThemeMode.system,
      home: const WeatherSearchScreen(),
    );
  }
}