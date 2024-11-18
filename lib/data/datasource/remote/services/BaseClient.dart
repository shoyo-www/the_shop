import 'package:the_shop/data/datasource/remote/services/dio/dio.dart';

class BaseNetworkClient {
  get getNetworkClient => WebUtil.createDio();
}
