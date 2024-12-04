import 'package:festival_tracker_app/loginPages/phoneLogin.dart';
import 'package:festival_tracker_app/loginPages/profileChecker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  AuthGate({Key? key}) : super(key: key);

  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          print("$uid already signed in");
          return ProfileGate();
        }
        return LoginWithPhone();
      },
    );
  }
}
