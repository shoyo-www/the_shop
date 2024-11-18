
import 'dart:convert';

CommonResponse commonResponseFromJson(String str) => CommonResponse.fromJson(json.decode(str));

class CommonResponse {
  final bool? status;
  final String? msg;

  CommonResponse({
    this.status,
    this.msg,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
    status: json["status"],
    msg: json["msg"],
  );

}
