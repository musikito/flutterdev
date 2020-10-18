import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:weather_app/api/openweathermap_weather_api.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/forecast_service.dart';
import 'package:weather_app/utils/strings.dart';
import 'package:weather_app/utils/temperature_convert.dart';

class ForecastViewModel with ChangeNotifier {
  bool isRequestPending = false;
  bool isWeatherLoaded = false;
  bool isRequestError = false;

  WeatherCondition _condition;
  String _description;
  double _minTemp;
  double _maxTemp;
  double _temp;
  double _feelsLike;
  int _locationId;
  DateTime _lastUpdated;
  String _city;
  double _latitude;
  double _longitude;
  List<Weather> _daily;
  bool _isDayTime;

/// the getter part

  WeatherCondition get condition => _condition;
  String get description => _description;
  double get minTemp => _minTemp;
  double get maTemp =>_maxTemp;
  double get temp => _temp;
  double get feelsLike => _feelsLike;
  int get locationId => _locationId;
  DateTime get lastUpdated => _lastUpdated;
  String get city => _city;
  double get latitude => _latitude;
  double get longitude => _longitude;
  List<Weather> get daily => _daily;
  bool get isDayTime => _isDayTime;

  ForecastService forecastService;

  ForecastViewModel(){
    forecastService = ForecastService(OpenWeatherMapWeatherApi());
  }


  Future<Forecast> getLatestWeather(String city) async {
    setRequestPendingState(true);
    this.isRequestError = false;

    Forecast latest;
    try {
      await Future.delayed(Duration(seconds: 1), () => {});

      latest = await forecastService
          .getWeather(city)
          .catchError((onError) => this.isRequestError = true);
    } catch (e) {
      this.isRequestError = true;
    }

    this.isWeatherLoaded = true;
    updateModel(latest, city);
    setRequestPendingState(false);
    notifyListeners();
    return latest;
  }

  void setRequestPendingState(bool isPending) {
    this.isRequestPending = isPending;
    notifyListeners();
  }

  void updateModel(Forecast forecast, String city) {
    if (isRequestError) return;

    _condition = forecast.current.condition;
    _city = Strings.toTitleCase(forecast.city);
    _description = Strings.toTitleCase(forecast.current.description);
    _lastUpdated = forecast.lastUpdated;
    _temp = TemperatureConvert.kelvinToCelsius(forecast.current.temp);
    _feelsLike =
        TemperatureConvert.kelvinToCelsius(forecast.current.fellLikeTemp);
    _longitude = forecast.longitude;
    _latitude = forecast.latitude;
    _daily = forecast.daily;
    _isDayTime = forecast.isDayTime;
  }

} //end of ForecastViewModel