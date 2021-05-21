import 'package:flutter/material.dart';
import 'package:up2us/screens/auth/signinScreen/widgets/loginSheet/login_button.dart';
import 'footer/login_with_email.dart';
import 'hearer/login_sheet_header.dart';

class LoginSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        LoginWithEmail(),
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
