import 'dart:convert';

ProductsResponse productsResponseFromJson(String str) => ProductsResponse.fromJson(json.decode(str));

class ProductsResponse {
  final bool? status;
  final String? msg;
  final List<Product>? product;

  ProductsResponse({
    this.status,
    this.msg,
    this.product,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => ProductsResponse(
    status: json["status"],
    msg: json["msg"],
    product: json["product"] == null ? [] : List<Product>.from(json["product"]!.map((x) => Product.fromJson(x))),
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
