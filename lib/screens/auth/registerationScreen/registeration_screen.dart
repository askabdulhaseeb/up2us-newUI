import 'package:flutter/material.dart';
import 'package:up2us/database/user_local_data.dart';

class RegisterationScreen extends StatelessWidget {
  static const routeName = '/RegisterationScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ${UserLocalData?.getDisplayName()}'),
      ),
    );
  }
}
