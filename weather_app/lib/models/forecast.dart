import 'package:weather_app/models/weather.dart';

class Forecast {
  /// This class will model the current weather and 3-day forecast.

  final DateTime lastUpdated;
  final double longitude;
  final double latitude;
  final List<Weather> daily;
  final Weather current;
  final bool isDayTime;
  String city;

  Forecast({
    this.lastUpdated,
    this.longitude,
    this.latitude,
    this.daily:const[],
    this.current,
    this.city,
    this.isDayTime
});

  static Forecast fromJson(dynamic json) {
    var weather = json['current']['weather'][0];
    var date =  DateTime.fromMillisecondsSinceEpoch(json['current']['dt'] * 1000, isUtc: true);

    var sunrise = DateTime.fromMillisecondsSinceEpoch(json['current']['sunrise'] * 1000, isUtc: true);
    var sunset = DateTime.fromMillisecondsSinceEpoch(json['current']['sunset'] * 1000, isUtc: true);

    // day or night
    bool isDay = date.isAfter(sunrise) && date.isBefore(sunset);

    // get the forecast for the next 3 days, excluding today
    bool hasDaily = json['daily'] != null;
    var tempDaily = [];
    if(hasDaily) {
      List items = json['daily'];

      tempDaily = items
      .map((item) => Weather.fromDailyJson(item))
      .toList()
      .skip(1)
      .take(3)
      .toList();
    } // end if

    var currentForecast = weather(
      cloudiness: int.parse(json['current']['clouds'].toString()),
      temp: json['current']['temp'].toDouble(),
      condition: Weather.mapStringToWeatherCondition(weather['main'], int.parse(json['current']['clouds'].toString())),
      description: weather['description'],
      fellLikeTemp: json['current']['feels_like'],
      date: date
    ); // end of currentForecast

    // we return the 'nice' forecast
    return Forecast(
      lastUpdated: DateTime.now(),
      current: currentForecast,
      latitude: json['lat'].toDouble(),
      longitude: json['lon'].toDouble(),
      daily: tempDaily,
      isDayTime: isDay

    );

  } // end fromJson

} // end class Forecast