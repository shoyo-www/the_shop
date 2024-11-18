import 'package:dartz/dartz.dart';
import 'package:the_shop/core/error/failures.dart';
import 'package:the_shop/data/datasource/remote/models/response/commonResponse.dart';
import 'package:the_shop/data/datasource/remote/models/response/loginResponse.dart';
import 'package:the_shop/data/datasource/remote/request/login_request.dart';
import 'package:the_shop/data/datasource/remote/request/register_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(LoginRequest loginParams);
  Future<Either<Failure, CommonResponse>> register(RegisterRequest register);
}
