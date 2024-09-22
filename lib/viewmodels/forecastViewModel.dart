
import 'package:weather/models/forecast.dart';


class ForecastViewModel {

  late Forecast _forecast ;

  ForecastViewModel(Forecast forecast) {
    _forecast = forecast;
  }

  List<ListElement>? get list {
    return _forecast.list;
  }

  City? get city {
    return _forecast.city;
  }
}