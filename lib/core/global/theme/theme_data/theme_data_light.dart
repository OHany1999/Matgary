import 'package:flutter/material.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';

ThemeData getThemeDataLight() => ThemeData(
      primaryColor: AppColorsLight.primaryColor,
      scaffoldBackgroundColor: AppColorsLight.backgroundColor,
      appBarTheme: AppBarTheme(
        color: AppColorsLight.appBarColor,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 36,color: Colors.black,fontFamily: 'Red Hat Display',fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16,color: Colors.white,fontFamily:'Poppins',fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 14,color: Colors.black,fontFamily:'Poppins',fontWeight: FontWeight.bold),
        bodySmall: TextStyle(fontSize: 12,color: AppColorsLight.grayColor,fontFamily:'Poppins',fontWeight: FontWeight.bold),
      ),
    );
