import 'package:equatable/equatable.dart';
import 'package:weather_counter_bloc/data_repository.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class LoadWeatherEvent extends WeatherEvent {
  final DataRepository repo;

  const LoadWeatherEvent(this.repo);

  @override
  List<Object> get props => [];
}
