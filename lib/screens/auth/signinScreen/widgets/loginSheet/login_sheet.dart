import 'package:flutter/material.dart';
import 'package:up2us/screens/auth/signinScreen/widgets/loginSheet/footer/login_with_email.dart';
import 'hearer/login_sheet_header.dart';

class LoginSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.66,
      width: size.width * 0.8,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginSheetHeader(),
          LoginWithEmail(),
        ],
      ),
    );
  }
}
