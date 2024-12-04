import 'package:festival_tracker_app/mainPages/overview.dart';
import 'package:festival_tracker_app/objects/storage_service.dart';
import 'package:festival_tracker_app/style/style.dart';
import 'package:festival_tracker_app/widgets/customDesign_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  String profilePic =
      "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png";

  var uid = FirebaseAuth.instance.currentUser?.uid;
  final db = FirebaseDatabase.instance.ref();

  FirebaseDatabase database = FirebaseDatabase.instance;

  TextEditingController myController = TextEditingController();

  void initState() {}

  void nameButton() async {
    final userDB = db.child("users/$uid");
    try {
      await userDB.update({"name": myController.text}).then((value) =>
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Overview())));
    } catch (e) {
      print("Error");
    }
  }

  final Storage storage = Storage();

  void imagePicker() async {
    final storageRef = FirebaseStorage.instance.ref();
    final results = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ["png", "jpg"]);

    if (results == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No profile picture selected")));
      return null;
    }
    final path = results.files.single.path;
    final fileName = results.files.single.name;

    storage.uploadFile(path!, fileName).then((value) async {
      final imageUrl = await storageRef
          .child("/userProfilePicture/$fileName")
          .getDownloadURL();
      DatabaseReference userCreatorRef =
          FirebaseDatabase.instance.ref("users/$uid");

      await userCreatorRef.update({
        "imageUrl": imageUrl,
      });
      profilePic = imageUrl;

      setState(() {});
    }).then((value) => print("done"));
  }

  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final userDB = db.child("users/$uid");
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Dein User Profile',
                    style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Container(
                  color: mainColor,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: imagePicker,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(profilePic),
                      radius: 70.0,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: MainUserTextInputField(
                      mainTextController: myController,
                      inputText: "NAME",
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: MainTextButton(
                      onPressFunction: nameButton,
                      buttonText: "WEITER",
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setNameDB(uid, myController) async {
    DatabaseReference userCreatorRef =
        FirebaseDatabase.instance.ref("users/$uid");

    await userCreatorRef.update({
      "name": "${myController.text}",
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Overview()));
  }
}
