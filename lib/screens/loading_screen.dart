import 'package:climax/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:climax/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climax/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    WeatherModel weatherModel = WeatherModel();
    var networkData = await weatherModel.getWeatherData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: networkData)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitFadingCircle(
      color: Colors.white,
      size: 50.0,
          )
      )
    );
  }
}
