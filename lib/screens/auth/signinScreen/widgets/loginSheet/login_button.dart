import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:up2us/database/auth_methods.dart';
import 'package:up2us/screens/auth/registerationScreen/registeration_screen.dart';
import 'package:up2us/utils/show_loading.dart';
import 'package:up2us/utils/show_toast.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> globalKey;
  final TextEditingController email;
  final TextEditingController username;
  final TextEditingController password;
  const LoginButton({
    @required this.globalKey,
    @required this.email,
    @required this.password,
    @required this.username,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (globalKey.currentState.validate()) {
          showLoadingDislog(context);
          if (email.text.substring(0, email.text.indexOf('@')).trim() ==
              username.text) {
            final User _user = await AuthMethods()
                .loginWithEmailAndPassword(email.text, password.text);
            Navigator.of(context).pop();
            if (_user != null) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RegisterationScreen.routeName,
                (route) => false,
              );
            }
          } else {
            showErrorToast('Username or Email is invaild');
          }
        }
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
