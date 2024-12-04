import 'package:festival_tracker_app/style/style.dart';
import 'package:festival_tracker_app/widgets/customDesign_widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final TextEditingController statusController = TextEditingController();

  var uid = FirebaseAuth.instance.currentUser?.uid;
  final db = FirebaseDatabase.instance.ref();

  FirebaseDatabase database = FirebaseDatabase.instance;

  void buttonFunction() async {
    final userDB = db.child("users/$uid");
    try {
      await userDB.update({
        "status": statusController.text,
        "statusTimeStamp": DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final userDB = db.child("users/$uid");
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text("PROFILE",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: mainColor)),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    width: double.infinity,
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png"),
                        radius: 70.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    width: double.infinity,
                    child: Center(
                      child: Text("Hier kommt der Status Kreis hin!!"),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    width: double.infinity,
                    child: Center(
                      child: Text("Dein Status:",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: mainColor)),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Center(
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(10),
                      child: MainTextInputField(
                          mainTextController: statusController,
                          inputText: "STATUS"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [Column(), Column()],
            ),
            Row(
              children: [
                Column(
                  children: [],
                ),
                Column(
                  children: [],
                ),
              ],
            ),
            Row(
              children: [Column(), Column()],
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: MainTextButton(
                          onPressFunction: buttonFunction,
                          buttonText: "Status setzen"),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
