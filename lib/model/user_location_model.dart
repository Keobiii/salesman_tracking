import 'package:salesman_tracking/model/user_model.dart';

class UserLocationModel {
  UserModel user;
  double latitude;
  double longitude;
  String marker;

  UserLocationModel({
    required this.user,
    required this.latitude,
    required this.longitude,
    required this.marker,
  });
}