import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {

  static final _auth = FirebaseAuth.instance;

  static User? get currentUser => _auth.currentUser;

  static String? get uid => _auth.currentUser?.uid;

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<String> signInEmailPassword(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
    
  }

  static Future<String> signUpEmailPassword(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print("${_auth.currentUser?.uid}");
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .set(
            {'email': email,
              'uid': _auth.currentUser?.uid,
            }
            );
      return 'success';
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

}