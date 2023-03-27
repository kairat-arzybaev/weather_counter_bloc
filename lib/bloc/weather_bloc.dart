import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_counter_bloc/bloc/weather_states.dart';
import 'package:weather_counter_bloc/data_repository.dart';

import 'weather_events.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final DataRepository dataRepository;
  WeatherBloc(this.dataRepository) : super(WeatherLoadingState()) {
    on<LoadWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        final weatherData = await dataRepository.getWeather();
        emit(WeatherLoadedState(weatherData));
      } catch (e) {
        emit(WeatherErrorState(e.toString()));
      }
    });
  }
}
