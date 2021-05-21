import 'package:flutter/material.dart';
import 'package:up2us/database/auth_methods.dart';
import 'package:up2us/screens/auth/registerationScreen/registeration_screen.dart';
import 'package:up2us/screens/auth/signinScreen/signin.dart';
import '../../config/app_images.dart';
import 'copyrights.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(iAppNameWithLogo),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Settings',
                style: textStyle,
              ),
            ),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Update',
                style: textStyle,
              ),
            ),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'About',
                style: textStyle,
              ),
            ),
            GestureDetector(
              onTap: () {
                AuthMethods().signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  SigninScreen.routeName,
                  (route) => false,
                );
              },
              child: const Text(
                'Signout',
                style: textStyle,
              ),
            ),
            const SizedBox(height: 20),
            Copyrights(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
