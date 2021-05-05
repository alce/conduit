import 'package:flutter/material.dart';

const green = Color(0xFF5CB85C);
const buttonHoverColor = Color(0xFF3D8B3D);
const lightGray = Color.fromRGBO(0, 0, 0, 0.3);
const borderColor = Color.fromRGBO(0, 0, 0, 0.1);
const darkGray = Color.fromRGBO(0, 0, 0, 0.6);
const fontColor = Color(0xFF373A3C);
const tagListBackground = Color(0xFFF3F3F3);
const tagChipBackground = Color(0xFF687077);
const maxLayoutWidth = 1140.0;

final theme = ThemeData(
  fontFamily: 'Source Sans Pro',
  scaffoldBackgroundColor: Colors.white,
  primaryColor: green,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    floatingLabelBehavior: FloatingLabelBehavior.never,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.disabled) ? lightGray : green;
        }),
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 22, horizontal: 30),
        ),
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.disabled) ? lightGray : green;
      }),
      splashFactory: NoSplash.splashFactory,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      splashFactory: NoSplash.splashFactory,
      foregroundColor: MaterialStateProperty.all(green),
    ),
  ),
);
