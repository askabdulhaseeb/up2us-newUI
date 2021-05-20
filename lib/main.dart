import 'package:flutter/material.dart';
import 'package:up2us/config/colors.dart';
import 'screens/auth/signinScreen/signin.dart';
import 'screens/splashScreen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '''Up2Us - Let's select eatables''',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        scaffoldBackgroundColor: darkColor,
        primaryColor: darkColor,
        accentColor: lightColor,
        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
      routes: {
        SplashScreen.routeName: (ctx) => SplashScreen(),
        SigninScreen.routeName: (ctx) => SigninScreen(),
      },
    );
  }
}
