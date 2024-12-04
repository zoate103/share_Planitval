import 'package:background_location/background_location.dart';
import 'package:festival_tracker_app/loginPages/authChecker.dart';
import 'package:festival_tracker_app/loginPages/create_user.dart';
import 'package:festival_tracker_app/mainPages/overview.dart';
import 'package:festival_tracker_app/style/style.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseDatabase.instance.setPersistenceEnabled(true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: backgroundColor),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String cameraIcon = "assets/images/permission_icons/yellow_icon.png";
  String gpsPermission = "assets/images/permission_icons/yellow_icon.png";
  String gpsEnabled = "assets/images/permission_icons/yellow_icon.png";

  Future<void> _checkPermission() async {
    final serviceStatus = await Permission.location.serviceStatus;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;
    if (!isGpsOn) {
      gpsEnabled = "assets/images/permission_icons/green_icon.png";
      setState(() {});
      print('Turn on location services before requesting permission.');
      return;
    } else {
      gpsEnabled = "assets/images/permission_icons/red_icon.png";
      setState(() {});
    }

    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.camera,
      //add more permission to request here.
    ].request();
    if (statuses[Permission.location] == PermissionStatus.granted) {
      print('Location permission granted');
      gpsPermission = "assets/images/permission_icons/green_icon.png";
      setState(() {});
    } else if (statuses[Permission.location] == PermissionStatus.denied) {
      print(
          'Location permission denied. Show a dialog and again ask for the permission');
    } else if (statuses[Permission.location] ==
        PermissionStatus.permanentlyDenied) {
      print('Location take the user to the settings page.');
      gpsPermission = "assets/images/permission_icons/red_icon.png";
      setState(() {});
      await openAppSettings();
    }

    if (statuses[Permission.camera] == PermissionStatus.granted) {
      print('Camera permission granted');
      cameraIcon = "assets/images/permission_icons/green_icon.png";
      setState(() {});
    } else if (statuses[Permission.camera] == PermissionStatus.denied) {
      print(
          'Camera permission denied. Show a dialog and again ask for the permission');
      cameraIcon = "assets/images/permission_icons/red_icon.png";
      setState(() {});
    } else if (statuses[Permission.camera] ==
        PermissionStatus.permanentlyDenied) {
      print('Camera take the user to the settings page.');
      cameraIcon = "assets/images/permission_icons/red_icon.png";
      setState(() {});
      await openAppSettings();
    }

    if (statuses[Permission.camera] == PermissionStatus.granted &&
        statuses[Permission.location] == PermissionStatus.granted &&
        isGpsOn) {
      await BackgroundLocation.stopLocationService();

      await BackgroundLocation.startLocationService(distanceFilter: 5);

      BackgroundLocation.setAndroidNotification(
        title: "Planitval",
        message: "Tracking location information for Planitval",
        icon: "@mipmap/ic_launcher",
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthGate()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 40,
                    ),
                    child: Center(
                      child: Image.asset("assets/images/logo/Logo.png"),
                    ),
                  ),
                ),
              ],
            ),
            Row(children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: const Center(
                    child: Text(
                      "PLANITVAL",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5B5B5B),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            Row(children: [
              Column(children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 70,
                    top: 50,
                  ),
                  child: Image.asset(cameraIcon),
                ),
              ]),
              Column(children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 26,
                    top: 50,
                  ),
                  child: Center(
                    child: Text(
                      "Camera permission",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
            ]),
            Row(children: [
              Column(children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 70,
                    top: 20,
                  ),
                  child: Image.asset(gpsPermission),
                ),
              ]),
              Column(children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 30,
                    top: 20,
                  ),
                  child: Center(
                    child: Text(
                      "GPS permission",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
            ]),
            Row(children: [
              Column(children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 70,
                    top: 20,
                  ),
                  child: Image.asset(gpsEnabled),
                ),
              ]),
              Column(children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 30,
                    top: 20,
                  ),
                  child: Center(
                    child: Text(
                      "GPS enabled",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
            ]),
            Row(children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mainColor),
                      ),
                      onPressed: _checkPermission,
                      child: Text(
                        'Retry',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
