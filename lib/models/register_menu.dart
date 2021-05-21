import 'package:flutter/material.dart';

class RegisterMenu {
  String title;
  String imageURL;
  RegisterMenu({
    @required this.title,
    @required this.imageURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageURL': imageURL,
    };
  }

  factory RegisterMenu.fromDocument(docs) {
    return RegisterMenu(
      title: docs.data()['title'].toString(),
      imageURL: docs.data()['imageURL'].toString(),
    );
  }
}
