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

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      final UserCredential result =
          await _firebaseAuth.signInWithCredential(credential);

      if (result != null) {
        final User user = result.user;
        final bool _isUserExist =
            await UserFirebaseMethods().isUserExist(uid: user.uid);
        if (!_isUserExist) {
          await UserFirebaseMethods().addUser(
            uid: user.uid,
            userInfoMap: UserFirebaseMethods().userToMap(user: user),
          );
        }
        UserLocalData.setUID(user.uid);
        UserLocalData.setDisplayName(user.displayName);
        UserLocalData.setEmail(user.email);
        UserLocalData.setImageURL(user.photoURL);
        UserLocalData.setUsername(user.email);
        return user;
      }
    } catch (e) {
      showErrorToast(e.toString());
      return null;
    }
    return null;
  }
}
