import 'package:festival_tracker_app/mainPages/overview.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'create_user.dart';

class ProfileGate extends StatefulWidget {
  ProfileGate({Key? key}) : super(key: key);

  @override
  State<ProfileGate> createState() => _ProfileGateState();
}

class _ProfileGateState extends State<ProfileGate> {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  final _userDB = FirebaseDatabase.instance.ref("users");

  @override
  void initState() {
    super.initState();
    userNameChecker();
  }

  Future<void> userNameChecker() async {
    final snapshot = await _userDB.child("$uid/name").get();
    if (snapshot.exists) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Overview()));
      print(snapshot.value);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const CreateUser()));
      print("no value");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
