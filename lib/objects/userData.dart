import 'package:flutter/material.dart';

class UserData {
  UserData(
      {required this.name,
      required this.status,
      required this.imageUrl,
      required this.statusTimeStamp,
      required this.longitude,
      required this.latitude,
      required this.gpsTimeStamp,
      required this.onStage});

  final String name;
  final String status;
  final String imageUrl;
  final DateTime statusTimeStamp;
  final double longitude;
  final double latitude;
  final DateTime gpsTimeStamp;
  late final bool onStage;

  factory UserData.fromRTDB(Map<String, dynamic> data) {
    return UserData(
      name: data["name"] ?? "",
      status: data["status"] ?? "",
      imageUrl: data["imageUrl"] ??
          "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png",
      statusTimeStamp: (data["statusTimeStamp"] != null)
          ? DateTime.fromMillisecondsSinceEpoch(data["statusTimeStamp"])
          : DateTime.now(),
      longitude: data["longitude"] ?? 0.0,
      latitude: data["latitude"] ?? 0.0,
      gpsTimeStamp: (data["gpsTimeStamp"] != null)
          ? DateTime.fromMillisecondsSinceEpoch(data["gpsTimeStamp"])
          : DateTime.now(),
      onStage: data["onStage"] ?? false,
    );
  }
}
