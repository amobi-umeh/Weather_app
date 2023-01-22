import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '05238e5f958a96d2803106ea6328289d',
      'units': 'imperial'
    };
    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      queryParameters,
    );

    final Response = await http.get(uri);

    final json = jsonDecode(Response.body);
    return WeatherResponse.fromJson(json);
  }
}
