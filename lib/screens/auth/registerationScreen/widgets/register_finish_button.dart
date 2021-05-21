import 'package:flutter/material.dart';

class RegisterFinishButton extends StatelessWidget {
  const RegisterFinishButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).accentColor,
            Theme.of(context).primaryColorDark,
          ],
        ),
      ),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.7,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Colors.black87,
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
              Colors.black87,
            ],
          ),
        ),
        child: const Text(
          'Finish',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
