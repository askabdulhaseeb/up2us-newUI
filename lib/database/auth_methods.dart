import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/show_toast.dart';
import 'user_firebase_methods.dart';
import 'user_local_data.dart';

class AuthMethods {
  Future<User> signInWithGoogle(BuildContext context) async {
    try {
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      final GoogleSignIn _googleSignIn = GoogleSignIn();

      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      print('Signin');

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      print('Auth');
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      print('Token');
      final UserCredential result =
          await _firebaseAuth.signInWithCredential(credential);
      print('Result');

      if (result != null) {
        final User user = result.user;
        final bool _isUserExist =
            await UserFirebaseMethods().isUserExist(uid: user.uid);
        if (!_isUserExist) {
          print('User Not Exist');
          await UserFirebaseMethods().addUser(
            uid: user.uid,
            userInfoMap: UserFirebaseMethods().userToMap(user: user),
          );
        }
        UserLocalData.setUID(user.uid);
        UserLocalData.setDisplayName(user.displayName);
        UserLocalData.setEmail(user.email);
        UserLocalData.setImageURL(user.photoURL);
        UserLocalData.setEmail(
          user.email.substring(0, user.email.indexOf('@')),
        );
        return user;
      }
    } catch (e) {
      showErrorToast(e.toString());
      return null;
    }
    return null;
  }
}
