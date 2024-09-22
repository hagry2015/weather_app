import 'dart:core';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/webservices.dart';
import 'package:weather/viewmodels/weatherViewModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/models/forecast.dart';

class WeatherDataViewModel extends ChangeNotifier {
  var forecast = Forecast();
  var weather = CurrentWeather();
  bool isLoading = false;

  // var mapType = MapType.normal;

  Future<void> getCurrentWeather(Position position) async {
    isLoading = true;
    final results = await Webservice().getCurrentWeather(position);

    //this.weather = result;
    weather = results;
    isLoading = false;
    //this.places = results.map((place) => PlaceViewModel(place)).toList();

    notifyListeners();
  }

  Future<void> getForecast(Position position) async {
    isLoading = true;

    final results = await Webservice().getForecast(position);

    //this.weather = result;
    forecast = results;
    isLoading = false;

    //this.places = results.map((place) => PlaceViewModel(place)).toList();

    notifyListeners();
  }

  Future<void> getCurrentWeatherWithCity(String cityName) async {
    isLoading = true;

    final results = await Webservice().getCurrentWeatherWithName(cityName);

    //this.weather = result;
    weather = results;
    //this.places = results.map((place) => PlaceViewModel(place)).toList();
    isLoading = false;

    notifyListeners();
  }

  Future<void> getForecastWithCity(String cityName) async {
    isLoading = true;

    final results = await Webservice().getForecastWithName(cityName);

    //this.weather = result;
    forecast = results;
    //this.places = results.map((place) => PlaceViewModel(place)).toList();
    isLoading = false;

    notifyListeners();
  }
}
