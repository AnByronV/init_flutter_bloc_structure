

import 'package:flutter/material.dart';


const seedColor = Color.fromARGB(255, 7, 80, 59);
const secondaryColor = Color(0xFFFF9C27);
const textColor = Color(0xFF565656);
const darkBackgroundColor = Color(0xFF09212E);

class AppTheme {

  final bool isDarkmode;

  AppTheme({ required this.isDarkmode });


  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      primaryColor: seedColor,
      secondaryHeaderColor: secondaryColor,
      dividerColor: textColor,
      canvasColor: isDarkmode ? darkBackgroundColor : seedColor,
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDarkmode ? darkBackgroundColor : Colors.white,
      primaryColorDark: darkBackgroundColor,
      listTileTheme: const ListTileThemeData(
        iconColor: seedColor,
      ), 
    textTheme: TextTheme(
        titleLarge: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: isDarkmode ? Colors.white : textColor,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: isDarkmode ? Colors.white : textColor,
        ),
        labelMedium: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: isDarkmode ? Colors.white : textColor,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: isDarkmode ? Colors.white : textColor,
        ),
      ),
  );

}