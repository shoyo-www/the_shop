

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:the_shop/constants/constants%202.dart';
import 'package:the_shop/core/error/failures.dart';
import 'package:the_shop/data/datasource/Repository_impl/home_repository_impl.dart';
import 'package:the_shop/data/datasource/remote/models/response/single_product.dart';
import 'package:the_shop/widgets/snackbar.dart';

class ProductController extends GetxController {
  bool loading = false;
  HomeRepositoryImpl homeRepositoryImpl = HomeRepositoryImpl();
  Product? product;

  @override
  void onInit()  {
    String id = Get.arguments['id'];
    getProducts(id);
    super.onInit();
  }

  getProducts(String id) async {
    if(await isNetworkAvailable() == false) {
      ToastUtil.showToast('No internet connected');
    } else {
      loading = true;
      update([ControllerBuilders.productController]);
      var data = await homeRepositoryImpl.getSingleProducts(id);
      data.fold((l) {
        if (l is ServerFailure) {
          ToastUtil.showToast(l.message);
          loading = false;
          update([ControllerBuilders.productController]);
        }
      }, (r) {
        if (r.status == true) {
          product = r.product;
          loading = false;
          update([ControllerBuilders.productController]);
        }
        else {
          loading = false;
          update([ControllerBuilders.productController]);
        }
      }
      );
      update([ControllerBuilders.homeController]);
    }

  }
}