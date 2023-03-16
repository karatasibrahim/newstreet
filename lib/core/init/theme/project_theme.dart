import 'package:flutter/material.dart';
import 'package:newstreet_app/core/constants/theme/light_theme.dart';

class ProjectThemeData extends ChangeNotifier {
  ThemeData _themeData;

  ProjectThemeData() {
    _themeData = lightTheme;
  }

  ThemeData get themeData => _themeData;
}
