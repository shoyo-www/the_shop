import 'dart:convert';


String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
  final String email;
  final String password;
  final String fullName;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.fullName,
  });


  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "fullName": fullName,
  };
}
