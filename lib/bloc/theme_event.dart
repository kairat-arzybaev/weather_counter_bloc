// abstract class ThemeEvent {}

// class ToggleTheme extends ThemeEvent {}

import 'package:weather_counter_bloc/bloc/theme_state.dart';

class ThemeEvent {
  const ThemeEvent._();
  const factory ThemeEvent.toggleTheme() = ToggleTheme;

  when({required Stream<ThemeState> Function() toggleTheme}) {}
}

class ToggleTheme extends ThemeEvent {
  const ToggleTheme() : super._();
}
