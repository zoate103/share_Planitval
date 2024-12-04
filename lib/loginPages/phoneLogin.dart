import 'package:festival_tracker_app/loginPages/create_user.dart';
import 'package:festival_tracker_app/mainPages/overview.dart';
import 'package:festival_tracker_app/style/style.dart';
import 'package:festival_tracker_app/widgets/customDesign_widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  TextEditingController phoneController = TextEditingController(text: "+43");
  TextEditingController otpController = TextEditingController();

  submitFunction() {
    if (otpVisibility) {
      verifyOTP();
    } else {
      loginWithPhone();
    }
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;
  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Center(
          child: HeaderText(
            text: "Login",
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: mainColor),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Use your phone number to login.",
              style: TextStyle(
                  fontSize: 10, fontWeight: FontWeight.bold, color: mainColor),
            ),
            const SizedBox(
              height: 10,
            ),
            MainPhoneTextInputField(
                mainTextController: phoneController, inputText: "Phone number"),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              child: MainPhoneTextInputField(
                  mainTextController: otpController, inputText: "Code"),
              visible: otpVisibility,
            ),
            const SizedBox(
              height: 10,
            ),
            MainTextButton(
                onPressFunction: submitFunction,
                buttonText: otpVisibility ? "Verify" : "Login")
          ],
        ),
      ),
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully!");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) {
      print("You are logged in successfully!");
      Fluttertoast.showToast(
          msg: "You are logged in successfully!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: backgroundColor,
          textColor: mainColor,
          fontSize: 16.0);
      if (FirebaseAuth.instance.currentUser != null) {
        print(FirebaseAuth.instance.currentUser?.uid);
      }
      var uid = FirebaseAuth.instance.currentUser?.uid;

      final nameChecker =
          FirebaseDatabase.instance.ref("users/$uid").child("name");

      nameChecker.once().then((event) {
        final dataSnapshot = event.snapshot;
        if (dataSnapshot.value != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Overview()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => CreateUser()));
        }
      });
    });
  }
}
