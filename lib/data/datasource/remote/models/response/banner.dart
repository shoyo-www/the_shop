import 'dart:convert';

BannerResponse bannerResponseFromJson(String str) => BannerResponse.fromJson(json.decode(str));


class BannerResponse {
  final bool? status;
  final String? msg;
  final List<Banner>? banner;

  BannerResponse({
    this.status,
    this.msg,
    this.banner,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) => BannerResponse(
    status: json["status"],
    msg: json["msg"],
    banner: json["banner"] == null ? [] : List<Banner>.from(json["banner"]!.map((x) => Banner.fromJson(x))),
  );

}

class Banner {
  final String? id;
  final String? image;
  final int? v;

  Banner({
    this.id,
    this.image,
    this.v,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["_id"],
    image: json["image"],
    v: json["__v"],
  );

}
