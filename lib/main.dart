// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:signup2/auth.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'FLutter login',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: new LoginPage(auth: new Auth()));
        home: new LoginPage());
  }
}
