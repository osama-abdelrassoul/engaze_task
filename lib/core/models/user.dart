import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String id;
  final String userName;
  final String userPhone;
  final String userToken;
  final String userPhoto;

  const User({
    this.email = '',
    this.id = '',
    this.userName = '',
    this.userPhone = '',
    this.userToken = '',
    this.userPhoto = '',
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        email: map['Email'] ?? "",
        id: map['UsersID'] ?? "",
        userName: map['UserName'] ?? "",
        userPhone: map['UserPhone'] ?? "",
        userToken: map["UserToken"] ?? "",
        userPhoto: map["UserPhoto"] ?? "");
  }

  @override
  List<Object?> get props =>
      [email, id, userName, userToken, userPhone, userPhone];
}
