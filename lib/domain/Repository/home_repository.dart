import 'package:dartz/dartz.dart';
import 'package:the_shop/core/error/failures.dart';
import 'package:the_shop/data/datasource/remote/models/response/banner.dart';
import 'package:the_shop/data/datasource/remote/models/response/category_response.dart';
import 'package:the_shop/data/datasource/remote/models/response/products_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, BannerResponse>> banner();
  Future<Either<Failure, CategoryResponse>> category();
  Future<Either<Failure, ProductsResponse>> products();
}