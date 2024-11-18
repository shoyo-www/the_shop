
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));


class LoginResponse {
  final bool? status;
  final String? msg;
  final String? token;
  final UserData? userData;

  LoginResponse({
    this.status,
    this.msg,
    this.token,
    this.userData,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    msg: json["msg"],
    token: json["token"],
    userData: json["userData"] == null ? null : UserData.fromJson(json["userData"]),
  );

}

class UserData {
  final String? id;
  final String? fullName;
  final String? email;
  final int? v;

  UserData({
    this.id,
    this.fullName,
    this.email,
    this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    v: json["__v"],
  );

}
