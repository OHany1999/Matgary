import 'package:flutter/material.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';

ThemeData getThemeDataLight() => ThemeData(
      primaryColor: AppColorsLight.primaryColor,
      scaffoldBackgroundColor: AppColorsLight.backgroundColor,
      appBarTheme: AppBarTheme(
        color: AppColorsLight.appBarColor,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 36,color: Colors.black),
        bodyLarge: TextStyle(fontSize: 16,color: Colors.white),
        bodyMedium: TextStyle(fontSize: 14,color: Colors.black),
        bodySmall: TextStyle(fontSize: 12,color: AppColorsLight.grayColor),
      ),
    );
