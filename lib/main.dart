import 'package:flutter/material.dart';
import 'package:weather/viewmodels/weatherDataViewModel.dart';
import 'package:weather/pages/homePage.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Hacker News",
        home:
        ChangeNotifierProvider(
          create: (context) => WeatherDataViewModel(),
          child: HomePage(),
        )
    );
  }
}