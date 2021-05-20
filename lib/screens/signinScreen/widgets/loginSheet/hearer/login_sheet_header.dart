import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginSheetHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Take the stress of deciding away and enjoy your meal.',
            style: TextStyle(fontSize: 8),
          ),
        ),
        InkWell(
          onTap: () {},
          splashColor: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(30),
          child: const OtherSigninMethod(
            icon: FontAwesomeIcons.google,
            text: 'Sign in with Google',
            color: Colors.green,
          ),
        ),
        InkWell(
          onTap: () {},
          splashColor: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(30),
          child: const OtherSigninMethod(
            icon: FontAwesomeIcons.facebook,
            text: 'Sign in with Facebook',
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 6),
        ORLineOfSigninPage(),
      ],
    );
  }
}

class OtherSigninMethod extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const OtherSigninMethod({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}

class ORLineOfSigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 10,
          width: size.width / 4.5,
          child: const Divider(color: Colors.blueGrey),
        ),
        const Text(
          'or Sign in with Email',
          style: TextStyle(fontSize: 8, color: Colors.blueGrey),
        ),
        SizedBox(
          height: 10,
          width: size.width / 4.5,
          child: const Divider(color: Colors.blueGrey),
        ),
      ],
    );
  }
}
