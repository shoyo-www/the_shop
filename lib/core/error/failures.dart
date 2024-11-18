import 'package:equatable/equatable.dart';
import 'package:the_shop/core/error/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);

}

class ServerFailure extends Failure {
  final String message;
  final ExceptionType type;

  const ServerFailure(this.message, this.type);

  @override
  List<Object?> get props => [message, type];
}

class NoDataFailure extends Failure {
  @override
  List<Object?> get props => [""];
}