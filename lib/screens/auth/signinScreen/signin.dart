import 'package:flutter/material.dart';
import '../../../config/app_images.dart';
import 'widgets/loginSheet/login_sheet.dart';
import 'widgets/signin_bg_design.dart';

class SigninScreen extends StatelessWidget {
  static const routeName = '/SigninScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SigninBackgroudDesign(),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 16),
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
          ),
        ],
      ),
    );
  }
}
