/*import 'dart:async';
import 'dart:html';
//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
}

class Auth implements BaseAuth {
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    final newUser = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return User.uid;
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    final newUser = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return Credential.User.uid;
  }
}*/
