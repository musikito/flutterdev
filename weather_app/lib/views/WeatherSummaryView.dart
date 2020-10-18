/// Our WeatherSummaryView is a simple StatelessWidget that displays the current
/// temperature (actual & feels-like) and picks an appropriate asset image
/// for the current weather condition.

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WeatherSummary extends StatelessWidget {
  final WeatherCondition condition;
  final double temp;
  final double feelsLike;
  final bool isdayTime;

  WeatherSummary(
      {Key key,
        @required this.condition,
        @required this.temp,
        @required this.feelsLike,
        @required this.isdayTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Text(
              '${_formatTemperature(this.temp)}°ᶜ',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Feels like ${_formatTemperature(this.feelsLike)}°ᶜ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        _mapWeatherConditionToImage(this.condition, this.isdayTime),
      ]),
    );
  }

  String _formatTemperature(double t) {
    var temp = (t == null ? '' : t.round().toString());
    return temp;
  }

  Widget _mapWeatherConditionToImage(
      WeatherCondition condition, bool isDayTime) {

    Image image;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        image = Image.asset('assets/images/wi-thunderstorm.png');
        break;
      case WeatherCondition.heavycloud:
        image = Image.asset('assets/images/wi-cloudy.png');
        break;
      case WeatherCondition.lightcloud:
        isDayTime
            ? image = Image.asset('assets/images/wi-day-cloudy.png')
            : image = Image.asset('assets/images/wi-night-partly-cloudy.png');
        break;
      case WeatherCondition.drizzle:
      case WeatherCondition.mist:
        image = Image.asset('assets/images/wi-day-sprinkle.png');
        break;
      case WeatherCondition.clear:
        isDayTime
            ? image = Image.asset('assets/images/wi-day-sunny.png')
            : image = Image.asset('assets/images/wi-night-clear.png');
        break;
      case WeatherCondition.fog:
        image = Image.asset('assets/images/wi-fog.png');
        break;
      case WeatherCondition.snow:
        image = Image.asset('assets/images/wi-snow.png');
        break;
      case WeatherCondition.rain:
        image = Image.asset('assets/images/wi-rain.png');
        break;
      case WeatherCondition.atmosphere:
        image = Image.asset('assets/images/wi-fog.png');
        break;

      default:
        image = Image.asset('assets/images/wi-na.png');
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: image);
  }
}