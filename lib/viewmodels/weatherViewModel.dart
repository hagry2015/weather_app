
import 'package:weather/models/weather.dart';


class WeatherViewModel {

  late CurrentWeather _weather ;

  WeatherViewModel(CurrentWeather weather) {
    _weather = weather;
  }

  int? get id {
    return _weather.id;
  }

  Sys? get sys {
    return _weather.sys;
  }

  int? get timezone {
    return _weather.timezone;
  }


  int? get cod {
    return _weather.cod;
  }
  String? get name {
    return _weather.name;
  }
  Coord? get coord {
    return _weather.coord;
  }

  List<Weather>? get weatherList {
    return _weather.weather;
  }

  String? get base {
    return _weather.base;
  }

  Main? get main {
    return _weather.main;
  }

  Wind? get wind {
    return _weather.wind;
  }

  Rain? get rain {
    return _weather.rain;
  }

  Clouds? get clouds {
    return _weather.clouds;
  }

  int? get dt {
    return _weather.dt;
  }


}