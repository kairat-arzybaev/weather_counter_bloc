import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_counter_bloc/models/city_weather_model.dart';

class DataRepository {
  var url =
      'https://api.openweathermap.org/data/2.5/weather?q=Dallas&appid=7c016019b9c94f9c8b4b8fa4ab1c8370&units=metric';
  Future<CityWeatherModel> getWeather() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      return CityWeatherModel.fromJson(result);
    } else {
      throw Exception('Failed to load weather: ${response.reasonPhrase}');
    }
  }
}
