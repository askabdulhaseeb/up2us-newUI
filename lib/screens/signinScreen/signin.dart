import 'package:flutter/material.dart';
import 'package:up2us/config/app_images.dart';
import 'widgets/loginSheet/login_sheet.dart';
import 'widgets/signin_bg_design.dart';

class SigninScreen extends StatelessWidget {
  static const routeName = '/SigninScreen';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SigninBackgroudDesign(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 140,
                  width: 140,
                  child: Image(
                    image: AssetImage(iAppNameWithLogo),
                  ),
                ),
                LoginSheet(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
