import 'package:salesman_tracking/model/status_model.dart';
import 'package:salesman_tracking/model/user_location_model.dart';
import 'package:salesman_tracking/model/user_model.dart';

final List<UserLocationModel> userLocations = [
  UserLocationModel(
    user: UserModel(
      id: "1",
      firstName: "Lorem",
      lastName: "Ipsum",
      username: "developer",
      status: StatusModel.online,
      avatar: "assets/avatar/user1.png",
    ),
    latitude: 14.559745601042923,
    longitude: 121.04734086455713,
    marker: "assets/marker/user1.png",
  ),
  UserLocationModel(
    user: UserModel(
      id: "2",
      firstName: "Crisostomo",
      lastName: "Ibarra",
      username: "damaincharacter",
      status: StatusModel.online,
      avatar: "assets/avatar/user2.png",
    ),
    latitude: 14.531000014207548, 
    longitude: 121.05815553158543,
    marker: "assets/marker/user2.png",
  ),
  UserLocationModel(
    user: UserModel(
      id: "3",
      firstName: "Padre",
      lastName: "Damaso",
      username: "yourchickpriest",
      status: StatusModel.busy,
      avatar: "assets/avatar/user3.png",
    ),
    latitude: 14.555259541275106,
    longitude: 121.02416657863105,
    marker: "assets/marker/user3.png",
  ),
  UserLocationModel(
    user: UserModel(
      id: "4",
      firstName: "Maria",
      lastName: "Clara",
      username: "mariaclara",
      status: StatusModel.away,
      avatar: "assets/avatar/user4.png"
    ),
    latitude: 14.560742490661262,
    longitude: 121.07823990904552,
    marker: "assets/marker/user4.png",
  ),
  UserLocationModel(
    user: UserModel(
      id: "5",
      firstName: "Sisa",
      lastName: "",
      username: "sisaisnotcrazy",
      status: StatusModel.offline,
      avatar: "assets/avatar/user5.png"
    ),
    latitude: 14.578021194627475,
    longitude: 121.0391011193602,
    marker: "assets/marker/user5.png",
  ),
];