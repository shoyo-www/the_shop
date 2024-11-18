
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:the_shop/core/error/exceptions.dart';
import 'package:the_shop/core/error/failures.dart';
import 'package:the_shop/data/datasource/remote/models/response/banner.dart';
import 'package:the_shop/data/datasource/remote/models/response/category_response.dart';
import 'package:the_shop/data/datasource/remote/models/response/products_response.dart';
import 'package:the_shop/data/datasource/remote/services/apis.dart';
import 'package:the_shop/data/datasource/remote/services/dio/rest_client.dart';
import 'package:the_shop/domain/Repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final _restClient = Get.find<RestClient>();

  @override
  Future<Either<Failure, BannerResponse>> banner() async {
    try {
      final res = await _restClient.get(url: Apis.banner);
      return Right(bannerResponseFromJson(res));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  @override
  Future<Either<Failure, CategoryResponse>> category() async {
    try {
      final res = await _restClient.get(url: Apis.category);
      return Right(categoryResponseFromJson(res));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  @override
  Future<Either<Failure, ProductsResponse>> products() async {
    try {
      final res = await _restClient.get(url: Apis.products);
      return Right(productsResponseFromJson(res));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }
}