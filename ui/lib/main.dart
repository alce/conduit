import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'theme.dart';

void main() {
  runApp(ProviderScope(child: Conduit()));
}

class Conduit extends StatelessWidget {
  @override
  Widget build(BuildContext cx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Source Sans Pro',
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(green),
            elevation: MaterialStateProperty.all<double>(0),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            ),
          ),
        ),
      ),
      home: HomeScreen(),
      routes: {
        SignUpScreen.routeName: (cx) => SignUpScreen(),
        LogInScreen.routeName: (cx) => LogInScreen(),
      },
    );
  }
}
