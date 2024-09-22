import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:provider/provider.dart';
import 'package:weather/viewmodels/weatherDataViewModel.dart';
import 'package:weather/viewmodels/forecastDataViewModel.dart';

import 'package:geolocator/geolocator.dart';
import 'package:weather/utils/locationHelper.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Position? _currentPosition;
  late Position position = Position(
      longitude: 0.0,
      latitude: 0.0,
      timestamp: DateTime.timestamp(),
      accuracy: 0,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0);


  void _getUserPosition() async {
    // GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();
    Position userLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // userLocation.longitude
    //Provider.of<WeatherDataViewModel>(context, listen: false).getCurrentWeather(const LatLng(Angle.degree(userLocation.latitude), Angle.degree(userLocation.longitude)));

    setState(() {
      position = userLocation;
      Provider.of<WeatherDataViewModel>(context, listen: false)
          .getCurrentWeather(position);
      Provider.of<WeatherDataViewModel>(context, listen: false)
          .getForecast(position);
    });
  }

  @override
  void initState() {
    super.initState();
    //print("Position @@@ {$currentPosition}");
     LocationHandler.handleLocationPermission().then((onValue){
      _getUserPosition();

    });


    //print("Position @@@ {$position}");
  }

  @override
  Widget build(BuildContext context) {
    // _currentPosition = await LocationHandler.getCurrentPosition();
    final vm = Provider.of<WeatherDataViewModel>(context);
    //debugPrint("${vm.weather.}");
    // print("Position @@@ {$position}");

    void onQueryChanged(String query) {
      print("QUERY ${query}");

      if (query == "") {
        Provider.of<WeatherDataViewModel>(context, listen: false)
            .getCurrentWeather(position);
        Provider.of<WeatherDataViewModel>(context, listen: false)
            .getForecast(position);
      } else {
        Provider.of<WeatherDataViewModel>(context, listen: false)
            .getCurrentWeatherWithCity(query);
        Provider.of<WeatherDataViewModel>(context, listen: false)
            .getForecastWithCity(query);
      }
    }

    //  print("XXXXXXX ${vm.weather}");
    return Scaffold(
        body: Container(
      color: Colors.blueAccent,
      child: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      onChanged: onQueryChanged,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Text(
                    "${vm.weather.name}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${vm.weather.weather?[0].main}",
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "L${vm.weather.main?.tempMin}°",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "H${vm.weather.main?.tempMax}°",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Container(
                      height: 400,
                      child: Card(
                          elevation: 0,
                          color: Colors.white24,
                          child: vm.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  // scrollDirection: Axis.vertical,
                                  // shrinkWrap: true,

                                  itemCount: vm.forecast.list?.length ?? 0,
                                  itemBuilder: (context, position) {
                                    return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(                             mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                            children: [
                                          Text(
                                            position == 0
                                                ? 'Today'
                                                : DateFormat('EE').format(vm
                                                    .forecast
                                                    .list![position]
                                                    .dtTxt),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                               DateFormat('hh:mma').format(vm
                                                .forecast
                                                .list![position]
                                                .dtTxt),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0),
                                          ),
                                          Text(
                                            "${vm.forecast.list![position].main?.tempMin}°",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0),
                                          ),
                                          Text(
                                            "${vm.forecast.list![position].main?.tempMax}°",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0),
                                          ),
                                          Text(
                                            "${vm.forecast.list![position].weather?[0].main}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0),
                                          ),

                                          Image.network('https://openweathermap.org/img/wn/${vm.forecast.list![position].weather?[0].icon}@2x.png', width: 50,
                                            height: 50,
                                          ),
                                        ]));
                                  },
                                )),
                    ),
                  ),
                ],
              ),
          ),
    ));
  }
}
