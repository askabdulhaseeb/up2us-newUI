import 'dart:async';
import 'package:flutter/material.dart';
import 'package:up2us/config/app_images.dart';
import 'package:up2us/database/user_local_data.dart';
import 'package:up2us/screens/auth/registerationScreen/registeration_screen.dart';
import '../auth/signinScreen/signin.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        if (UserLocalData?.getUID() != '') {
          Navigator.of(context).pushNamedAndRemoveUntil(
              RegisterationScreen.routeName, (route) => false);
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              SigninScreen.routeName, (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 140,
          width: 140,
          child: Image.asset(iAppNameWithLogo),
        ),
      ),
    );
  }
}
