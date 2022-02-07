//import 'auth.dart';
// ignore_for_file: unnecessary_new, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  //LoginPage({required this.auth});
  //final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final forKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  FormType _formType = FormType.login;

  String get value => '';

  // ignore: non_constant_identifier_names
  bool ValidateandSave() {
    // ignore: non_constant_identifier_names
    final Form = forKey.currentState!;
    if (Form.validate()) {
      Form.save();
      return true;
    }
    return false;
  }

  /* void validateandSubmit() async {
    if (ValidateandSave()) {
      try {
        if (_formType == FormType.login) {
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
          final newUser = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);
          print('Signed in:$userId');
        } else {
          String userId = await widget.auth
              .createUserWithEmailAndPassword(_email, _password);
          final newUser = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password);
          print('Registered user :$userId');
        }
      } catch (e) {
        print('Error : $e');
      }
    }
  }*/

  void validateandSubmit() async {
    if (ValidateandSave()) {
      try {
        if (_formType == FormType.login) {
          //String userId =await widget.auth.signInWithEmailAndPassword(_email, _password);
          //print('Signed in:$userId');
        } else {
          //String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
          // ignore: unused_local_variable
          final newUser =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  // email: _email, password: _password);
                  email: _email,
                  password: _password);
          //print('Registered user :$userId');
          print('$_email');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void moveToRegister() {
    //forKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Flutter Login page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: new Form(
          key: forKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: buildInputs() + buildSubmitButtons(),
          ),
        ),
      ),
    );
  }

  String? validationEmail(String? value) {
    if (value != null) {
      if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
        return null;
      }
    }
    return 'Enter a valid Emaill address';
  }

  List<Widget> buildInputs() {
    return [
      TextFormField(
        decoration: const InputDecoration(labelText: 'Email'),
        autovalidateMode: AutovalidateMode.always,
        //validator: (value) => value!.isEmpty ? 'Email cant be empty' : null,
        validator: (value) => value!.isEmpty || !value.contains("@")
            ? "enter a valid eamil"
            : null,

        //validator: (value) => !isEmail(value) ? "Invalid Email" : null;,
        onSaved: (newValue) => _email = value,
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) => value!.isEmpty ? 'Password cant be empty' : null,
        onSaved: (newValue) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        FlatButton(onPressed: validateandSubmit, child: new Text('Login')),
        new FlatButton(
            onPressed: moveToRegister,
            child: const Text(
              'Create an account',
            )),
      ];
    } else {
      return [
        FlatButton(
            onPressed: validateandSubmit,
            child: const Text('Create an account')),
        new FlatButton(
          onPressed: moveToLogin,
          child: const Text('Have an account ? Login'),
        )
      ];
    }
  }
}
