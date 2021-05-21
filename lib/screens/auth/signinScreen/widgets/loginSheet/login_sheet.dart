import 'package:flutter/material.dart';
import '../custom_text_form_field.dart';
import 'hearer/login_sheet_header.dart';
import 'login_button.dart';

class LoginSheet extends StatefulWidget {
  @override
  _LoginSheetState createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            height: size.height * 0.64 + 20,
            width: size.width * 0.8,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.64,
                  width: size.width * 0.8,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginSheetHeader(),
                        Form(
                          key: _globalKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              const Text('Username*', style: textStyle),
                              CustomTextFormField(
                                  controller: _username, hint: 'Your name'),
                              const SizedBox(height: 6),
                              const Text('Email*', style: textStyle),
                              CustomTextFormField(
                                  controller: _email, hint: 'mail@website.com'),
                              const SizedBox(height: 6),
                              const Text('Password*', style: textStyle),
                              CustomTextFormField(
                                controller: _password,
                                hint: 'Min. 8 charecters',
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  left: 60,
                  right: 60,
                  child: LoginButton(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
