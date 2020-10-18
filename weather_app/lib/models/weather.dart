import 'package:weather_app/utils/strings.dart';
import 'package:equatable/equatable.dart';

enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  mist,
  fog,
  lightcloud,
  heavycloud,
  clear,
  unknown
} //end of WeatherCondition

class Weather {
  final WeatherCondition condition;
  final String description;
  final double temp;
  final double fellLikeTemp;
  final int cloudiness;
  final DateTime date;

  Weather ({
    this.condition,
    this.description,
    this.temp,
    this.fellLikeTemp,
    this.cloudiness,
    this.date,

  });

  static Weather fromDailyJson(dynamic daily) {
    var cloudiness = daily['clouds'];
    var weather = daily['weather'][0];

    return Weather(
      condition: mapStringToWeatherCondition(weather['main'], cloudiness),
      description: Strings.toTitleCase(weather['description']),
      cloudiness: cloudiness,
      temp: daily['temp']['day'].toDouble(),
      date: DateTime.fromMicrosecondsSinceEpoch(daily['dt'] * 1000, isUtc: true),
      fellLikeTemp: daily['feels_like']['day'].toDouble());

  } // end fromDailyJson

  static WeatherCondition mapStringToWeatherCondition(String input, int cloudiness) {
    WeatherCondition condition;
    switch(input) {
      case 'Thunderstorm':
        condition = WeatherCondition.thunderstorm;
        break;

      case 'Drizzle':
        condition = WeatherCondition.drizzle;
        break;

      case 'Rain' :
        condition = WeatherCondition.rain;
        break;
      case 'Snow' :
        condition = WeatherCondition.snow;
        break;
      case 'Clear' :
        condition = WeatherCondition.clear;
        break;

      case 'Clouds' :
        condition = (cloudiness >= 85) ? WeatherCondition.heavycloud : WeatherCondition.lightcloud;
        break;
      case 'Mist' :
        condition = WeatherCondition.mist;
        break;

      case 'fog' :
        condition = WeatherCondition.fog;
        break;
      case 'Smoke':
      case 'Haze':
      case 'Dust':
      case 'Sand':
      case 'Ash':
      case 'Squall':
      case 'Tornado':
        condition = WeatherCondition.atmosphere;
        break;
      default:
        condition = WeatherCondition.unknown;
    } // switch
    return condition;
  } // end WeatherCondition
} // end of weather class