import 'package:flutter/material.dart';
import '../../../../config/colors.dart';

class SigninBackgroudDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height * 0.68,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.centerLeft,
              colors: [
                orangeColor,
                Theme.of(context).accentColor,
              ]),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(240),
          ),
        ),
      ),
    );
  }
}
