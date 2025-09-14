import 'package:salesman_tracking/model/status_model.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final StatusModel status;
  final String avatar;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.status,
    required this.avatar,
  });
}