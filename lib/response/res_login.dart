// To parse this JSON data, do
//
//     final resLogin = resLoginFromJson(jsonString);

import 'dart:convert';

ResLogin resLoginFromJson(String str) => ResLogin.fromJson(json.decode(str));

String resLoginToJson(ResLogin data) => json.encode(data.toJson());

class ResLogin {
  String message;
  int status;
  User user;

  ResLogin({
    required this.message,
    required this.status,
    required this.user,
  });

  factory ResLogin.fromJson(Map<String, dynamic> json) => ResLogin(
    message: json["message"],
    status: json["status"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "user": user.toJson(),
  };
}

class User {
  String userId;
  String userNama;
  String userEmail;
  String userPassword;
  String userHp;
  String userStatus;
  String userLevel;
  dynamic userToken;
  DateTime userTanggal;
  String userImage;

  User({
    required this.userId,
    required this.userNama,
    required this.userEmail,
    required this.userPassword,
    required this.userHp,
    required this.userStatus,
    required this.userLevel,
    required this.userToken,
    required this.userTanggal,
    required this.userImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    userNama: json["user_nama"],
    userEmail: json["user_email"],
    userPassword: json["user_password"],
    userHp: json["user_hp"],
    userStatus: json["user_status"],
    userLevel: json["user_level"],
    userToken: json["user_token"],
    userTanggal: DateTime.parse(json["user_tanggal"]),
    userImage: json["user_image"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_nama": userNama,
    "user_email": userEmail,
    "user_password": userPassword,
    "user_hp": userHp,
    "user_status": userStatus,
    "user_level": userLevel,
    "user_token": userToken,
    "user_tanggal": userTanggal.toIso8601String(),
    "user_image": userImage,
  };
}
