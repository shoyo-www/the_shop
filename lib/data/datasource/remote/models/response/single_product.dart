import 'dart:convert';

SingleProduct singleProductFromJson(String str) => SingleProduct.fromJson(json.decode(str));


class SingleProduct {
  final bool? status;
  final String? msg;
  final Product? product;

  SingleProduct({
    this.msg,
    this.product,
    this.status
  });

  factory SingleProduct.fromJson(Map<String, dynamic> json) => SingleProduct(
    status: json["status"],
    msg: json["msg"],
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
  );

}

class Product {
  final String? id;
  final String? productName;
  final int? productPrice;
  final int? quantity;
  final String? description;
  final String? category;
  final String? subCategory;
  final List<String>? images;
  final bool? popular;
  final bool? recommend;
  final int? v;

  Product({
    this.id,
    this.productName,
    this.productPrice,
    this.quantity,
    this.description,
    this.category,
    this.subCategory,
    this.images,
    this.popular,
    this.recommend,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    productName: json["productName"],
    productPrice: json["productPrice"],
    quantity: json["quantity"],
    description: json["description"],
    category: json["category"],
    subCategory: json["subCategory"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    popular: json["popular"],
    recommend: json["recommend"],
    v: json["__v"],
  );

}
