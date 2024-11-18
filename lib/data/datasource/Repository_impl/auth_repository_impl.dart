import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:the_shop/core/error/exceptions.dart';
import 'package:the_shop/core/error/failures.dart';
import 'package:the_shop/data/datasource/remote/models/response/commonResponse.dart';
import 'package:the_shop/data/datasource/remote/models/response/loginResponse.dart';
import 'package:the_shop/data/datasource/remote/request/login_request.dart';
import 'package:the_shop/data/datasource/remote/request/register_request.dart';
import 'package:the_shop/data/datasource/remote/services/apis.dart';
import 'package:the_shop/data/datasource/remote/services/dio/rest_client.dart';
import 'package:the_shop/domain/Repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _restClient = Get.find<RestClient>();

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest loginParams) async {
    try {
     final res = await _restClient.post(url: Apis.login, request: loginParams.toJson());
       return Right(loginResponseFromJson(res));
    } on ApiException catch (e) {
        return Left(ServerFailure(e.message,e.type));
    }
  }

  @override
  Future<Either<Failure, CommonResponse>> register(RegisterRequest register) async {
    try {
      final res = await _restClient.post(url: Apis.register, request: register.toJson());
      return Right(commonResponseFromJson(res));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }
}