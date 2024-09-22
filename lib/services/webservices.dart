import 'dart:convert';

import 'package:weather/models/forecast.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/utils/urlHelper.dart';
import 'package:http/http.dart' as http;
import 'package:latlng/latlng.dart';
import 'package:geolocator/geolocator.dart';
class Webservice {

  Future<CurrentWeather> getCurrentWeather( Position position) async {

    final urlString = UrlHelper.getCurrentWeather(position);
    final url = Uri.parse(urlString);

    final response = await http.get(url );
    print("${response.body} ${url}");
    if(response.statusCode == 200) {


      Map<String, dynamic> map = jsonDecode(response.body);
      CurrentWeather weather = CurrentWeather.fromJson(map);
      return weather;

    } else {
      throw Exception("Unable to perform request!");
    }

  }

  Future<Forecast> getForecast( Position position) async {

    final urlString = UrlHelper.getForecast(position);
    final url = Uri.parse(urlString);

    final response = await http.get(url );
    print("${response.body} ${url}");
    if(response.statusCode == 200) {


      Map<String, dynamic> map = jsonDecode(response.body);
      Forecast forecast = Forecast.fromJson(map);
      return forecast;

    } else {
      throw Exception("Unable to perform request!");
    }

  }

  Future<CurrentWeather> getCurrentWeatherWithName( String cityName) async {

    final urlString = UrlHelper.getCurrentWeatherWithCity(cityName);
    final url = Uri.parse(urlString);

    final response = await http.get(url );
    print("${response.body} ${url}");
    if(response.statusCode == 200) {


      Map<String, dynamic> map = jsonDecode(response.body);
      CurrentWeather weather = CurrentWeather.fromJson(map);
      return weather;

    } else {
      throw Exception("Unable to perform request!");
    }

  }

  Future<Forecast> getForecastWithName( String cityName) async {

    final urlString = UrlHelper.getForecastWithCity(cityName);
    final url = Uri.parse(urlString);

    final response = await http.get(url );
    print("${response.body} ${url}");
    if(response.statusCode == 200) {


      Map<String, dynamic> map = jsonDecode(response.body);
      Forecast forecast = Forecast.fromJson(map);
      return forecast;

    } else {
      throw Exception("Unable to perform request!");
    }

  }
}