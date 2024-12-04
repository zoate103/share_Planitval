import 'package:flutter/material.dart';

class DjData {
  DjData({
    required this.number,
    required this.name,
    required this.time,
  });

  final int number;
  final String name;
  final String time;

  factory DjData.fromRTDB(Map<String, dynamic> data) {
    return DjData(
      name: data["DJ"] ?? "Error",
      number: data["number"] ?? 0,
      time: data["time"] ?? "Error",
    );
  }
}
