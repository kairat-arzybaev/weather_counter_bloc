import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_counter_bloc/bloc/theme_event.dart';
import 'package:weather_counter_bloc/bloc/theme_state.dart';

// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc() : super(ThemeState(themeData: ThemeData.light()));

//   @override
//   Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
//     if (event is ToggleTheme) {
//       final newThemeData = state.themeData == ThemeData.light()
//           ? ThemeData.dark()
//           : ThemeData.light();
//       yield state.copyWith(themeData: newThemeData);
//     }
//   }
// }

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: ThemeData.light()));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    yield* event.when(
      toggleTheme: () async* {
        final newThemeData = state.themeData == ThemeData.light()
            ? ThemeData.dark()
            : ThemeData.light();
        yield state.copyWith(themeData: newThemeData);
      },
    );
  }
}
