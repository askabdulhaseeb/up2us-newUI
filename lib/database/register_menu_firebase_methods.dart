import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterMenuFirebaseMethods {
  static const String _fRegisterMenu = 'register_dish';

  Future<QuerySnapshot<Map<String, dynamic>>> getRegisterMenuItems() async {
    return FirebaseFirestore.instance.collection(_fRegisterMenu).get();
  }
}
