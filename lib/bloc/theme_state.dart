import 'package:flutter/material.dart';

enum ThemeMode { light, dark }

class ThemeState {
  final ThemeData themeData;

  ThemeState({required this.themeData});

  ThemeState copyWith({ThemeData? themeData}) {
    return ThemeState(themeData: themeData ?? this.themeData);
  }
}
