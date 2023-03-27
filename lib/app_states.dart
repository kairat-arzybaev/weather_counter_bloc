import 'package:equatable/equatable.dart';
import 'package:weather_counter_bloc/models/city_weather_model.dart';

abstract class AppStates extends Equatable {}

// weather data loading state
class WeatherLoadingState extends AppStates {
  @override
  List<Object> get props => [];
}

// weather data loaded state
class WeatherLoadedState extends AppStates {
  WeatherLoadedState(this.cityWeather);

  final CityWeatherModel cityWeather;
  @override
  List<Object> get props => [cityWeather];
}

// weather data loading error state
class WeatherErrorState extends AppStates {
  WeatherErrorState(this.error);

  final String error;
  @override
  List<Object> get props => [error];
}
