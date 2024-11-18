
import 'package:get/get.dart';
import 'package:the_shop/data/datasource/remote/services/dio/rest_client.dart';

class InitialBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(RestClient(), permanent: true);
  }
}
