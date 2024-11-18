import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) => CategoryResponse.fromJson(json.decode(str));


class CategoryResponse {
  final bool? status;
  final String? msg;
  final List<Category>? category;

  CategoryResponse({
    this.status,
    this.msg,
    this.category,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    status: json["status"],
    msg: json["msg"],
    category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))),
  );

}

class Category {
  final String? id;
  final String? name;
  final String? image;
  final int? v;

  Category({
    this.id,
    this.name,
    this.image,
    this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    v: json["__v"],
  );

}
