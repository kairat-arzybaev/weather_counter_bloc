import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_counter_bloc/app_states.dart';
import 'package:weather_counter_bloc/data_repository.dart';

import 'app_events.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  final DataRepository dataRepository;
  AppBlocs(this.dataRepository) : super(WeatherLoadingState()) {
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
