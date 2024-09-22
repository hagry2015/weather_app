import 'dart:core';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:weather/models/forecast.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/webservices.dart';
import 'package:weather/viewmodels/forecastViewModel.dart';
import 'package:geolocator/geolocator.dart';

class ForecastDataViewModel extends ChangeNotifier {

  //var forecast = Forecast();
  // var mapType = MapType.normal;

  Future<void> getForecast(Position position) async {

    final results = await Webservice().getForecast(position);

    //this.weather = result;
    //forecast = results;
    //this.places = results.map((place) => PlaceViewModel(place)).toList();

    notifyListeners();

  }

}