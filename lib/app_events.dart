import 'package:equatable/equatable.dart';
import 'package:weather_counter_bloc/data_repository.dart';

abstract class AppEvents extends Equatable {
  const AppEvents();
}

class LoadWeatherEvent extends AppEvents {
  final DataRepository repo;

  const LoadWeatherEvent(this.repo);

  @override
  List<Object> get props => [];
}
