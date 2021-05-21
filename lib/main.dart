import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:up2us/database/user_local_data.dart';
import 'config/colors.dart';
import 'screens/auth/registerationScreen/registeration_screen.dart';
import 'screens/auth/signinScreen/signin.dart';
import 'screens/splashScreen/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserLocalData.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '''Up2Us - Let's select eatables''',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        scaffoldBackgroundColor: darkColor,
        primaryColor: darkColor,
        accentColor: lightColor,
        splashColor: orangeColor,
        primaryColorDark: orangeColor,
        primarySwatch: Colors.orange,
        iconTheme: const IconThemeData(color: orangeColor),
      ),
      home: SplashScreen(),
      routes: {
        SplashScreen.routeName: (ctx) => SplashScreen(),
        SigninScreen.routeName: (ctx) => SigninScreen(),
        RegisterationScreen.routeName: (ctx) => RegisterationScreen(),
      },
    );
  }
}


// Certificate fingerprints:
//   SHA1: F6:3C:6E:07:37:98:D1:37:8D:8D:AD:2B:80:BE:5E:2C:50:EF:71:F9
//   SHA256: B8:1F:B2:FF:CB:2E:A2:45:12:1B:22:43:35:C5:B6:CC:A5:3B:CE:D4:6B:97:93:EF:76:D9:81:0F:F9:16:4C:6E