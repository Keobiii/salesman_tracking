import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatusModel {
  final String status;
  final Color color;
  const StatusModel({ required this.status, required this.color });

  // predefined constants
  static const online  = StatusModel(status: 'Online',  color: Colors.green);
  static const busy    = StatusModel(status: 'Busy',    color: Colors.red);
  static const away    = StatusModel(status: 'Away',    color: Colors.orange);
  static const offline = StatusModel(status: 'Offline', color: Colors.grey);
}