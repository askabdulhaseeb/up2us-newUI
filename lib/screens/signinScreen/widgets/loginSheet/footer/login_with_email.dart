import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class LoginWithEmail extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontWeight: FontWeight.bold);
    return Form(
      key: _globalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Username*', style: textStyle),
          CustomTextFormField(controller: _username, hint: 'Your name'),
          const Text('Email*', style: textStyle),
          CustomTextFormField(controller: _email, hint: 'mail@website.com'),
          const Text('Password*', style: textStyle),
          CustomTextFormField(
            controller: _password,
            hint: 'Min. 8 charecters',
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
