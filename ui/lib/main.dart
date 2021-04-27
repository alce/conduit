import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.dart';
import 'screens/article_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: FutureBuilder(
        future: Future.value(null),
        builder: (cx, _) {
          final _auth = cx.read(auth.notifier);
          return Conduit(_auth.loginFromLocalStorage());
        },
      ),
    ),
  );
}

class Conduit extends StatelessWidget {
  const Conduit(this._authFuture);
  final Future<void> _authFuture;

  @override
  Widget build(BuildContext cx) {
    return FutureBuilder(
      future: _authFuture,
      builder: (cx, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Source Sans Pro',
            scaffoldBackgroundColor: Colors.white,
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return states.contains(MaterialState.disabled)
                        ? lightGray
                        : green;
                  }),
                  elevation: MaterialStateProperty.all<double>(0),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 22, horizontal: 30),
                  ),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 16))),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  return states.contains(MaterialState.disabled)
                      ? lightGray
                      : green;
                }),
                splashFactory: NoSplash.splashFactory,
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  return states.contains(MaterialState.hovered)
                      ? buttonHoverColor
                      : green;
                }),
              ),
            ),
          ),
          home: HomeScreen(),
          routes: {
            SignUpScreen.routeName: (cx) => SignUpScreen(),
            LogInScreen.routeName: (cx) => LogInScreen(),
            ArticleScreen.routeName: (cx) => ArticleScreen(),
          },
        );
      },
    );
  }
}
