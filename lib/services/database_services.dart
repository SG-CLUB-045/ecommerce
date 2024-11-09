

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop/models/user_model.dart';

class DatabaseServices {

  static final _firestore = FirebaseFirestore.instance;

  static Future<UserModel?> getUser(String uid) async {
    return _firestore
        .collection('users')
        .doc(uid)
        .get()
        .then((snapshot) => UserModel.fromMap(snapshot.data() as Map<String, dynamic>));
  } 

  static Future<void> setUser(UserModel userModel) async {
    return _firestore
        .collection('users')
        .doc(userModel.uid)
        .set(UserModel.toMap(userModel));
  }

}