import 'package:flutter/material.dart';
import 'package:up2us/screens/auth/registerationScreen/registeration_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          RegisterationScreen.routeName,
          (route) => false,
        );
      },
      child: Container(
        height: 40,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Colors.black87,
              Theme.of(context).primaryColor.withOpacity(0.8),
              Colors.black87,
            ],
          ),
        ),
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
