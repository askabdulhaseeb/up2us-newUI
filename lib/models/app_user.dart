import 'package:flutter/material.dart';

class AppUser {
  final String _uid;
  final String _username;
  final String _displayName;
  final String _email;
  final String _imageURL;

  AppUser({
    @required String uid,
    String username,
    String displayName,
    String email,
    String imageURL,
  })  : _uid = uid,
        _username = username,
        _displayName = displayName,
        _email = email,
        _imageURL = imageURL;

  Map<String, dynamic> toMap() {
    return {
      'uid': _uid ?? '',
      'displayName': _displayName ?? '',
      'username': _username ?? '',
      'email': _email ?? '',
      'imageURL': _imageURL ?? '',
    };
  }

  factory AppUser.fromDocument(doc) {
    return AppUser(
      uid: doc.data()['uid'].toString() ?? '',
      displayName: doc.data()['displayName'].toString() ?? '',
      username: doc.data()['username'].toString() ?? '',
      imageURL: doc.data()['imageURL'].toString() ?? '',
      email: doc.data()['email'].toString() ?? '',
    );
  }

  String get getUID => _uid ?? '';
  String get getUsername => _username ?? '';
  String get getDisplayName => _displayName ?? '';
  String get getEmail => _email ?? '';
  String get getImageURL => _imageURL ?? '';
}
