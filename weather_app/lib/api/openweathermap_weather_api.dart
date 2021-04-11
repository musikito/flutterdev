import 'dart:convert';
import 'dart:developer';
import 'weather_api.dart';

import 'package:http/http.dart' as http;
//import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location.dart';

class OpenWeatherMapWeatherApi extends WeatherApi {

  // TODO needs to move this to a separate file and add to gitignore
  static const endPointUrl = 'https://api.openweathermap.org/data/2.5';
  static const apiKey = "63616431d3d1f75661aacbb3bc97ef47";

  http.Client httpClient;

  OpenWeatherMapWeatherApi () {
    this.httpClient = new http.Client();
  }

  Future<Location> getLocation(String city) async {
    final requestUrl = '$endPointUrl/weather?q=$city&APPID=$apiKey';
    final response = await this.httpClient.get(Uri.encodeFull(requestUrl));
    if(response.statusCode != 200) {
      throw Exception('error retrieving data for city $city: ${response.statusCode}');
    }// end if
    return Location.fromJson(jsonDecode(response.body));
  } // end getLocation
  @override
  Future<Forecast> getWeather(Location location) async {
    final requestUrl = '$endPointUrl/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&APPID=$apiKey';
    final response = await this.httpClient.get(Uri.encodeFull(requestUrl));

    if(response.statusCode != 200){
      throw Exception( 'error retrieving weather: ${response.statusCode}');
    }//end if
    return Forecast.fromJson(jsonDecode(response.body));
  }// end getWeather
} // end of class OpenWeatherMapWeatherApi

