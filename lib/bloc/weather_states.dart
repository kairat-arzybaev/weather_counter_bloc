import 'package:equatable/equatable.dart';
import 'package:weather_counter_bloc/models/city_weather_model.dart';

abstract class WeatherState extends Equatable {}

// weather data loading state
class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

// weather data loaded state
class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(this.cityWeather);

  final CityWeatherModel cityWeather;
  @override
  List<Object> get props => [cityWeather];
}

// weather data loading error state
class WeatherErrorState extends WeatherState {
  WeatherErrorState(this.error);

  final String error;
  @override
  List<Object> get props => [error];
}
