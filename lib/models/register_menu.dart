import 'package:flutter/material.dart';

class RegisterMenu {
  String id;
  String title;
  String imageURL;
  bool isSelected;
  RegisterMenu({
    @required this.id,
    @required this.title,
    @required this.imageURL,
    this.isSelected = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': '',
      'title': title,
      'imageURL': imageURL,
    };
  }

  factory RegisterMenu.fromDocument(docs) {
    return RegisterMenu(
      id: docs?.data()['id'].toString(),
      title: docs?.data()['title'].toString(),
      imageURL: docs?.data()['imageURL'].toString(),
    );
  }
}
