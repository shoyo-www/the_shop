import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:the_shop/constants/constants%202.dart';
import 'package:the_shop/core/error/failures.dart';
import 'package:the_shop/data/datasource/Repository_impl/home_repository_impl.dart';
import 'package:the_shop/data/datasource/remote/models/response/banner.dart';
import 'package:the_shop/data/datasource/remote/models/response/category_response.dart';
import 'package:the_shop/data/datasource/remote/models/response/products_response.dart';
import 'package:the_shop/widgets/snackbar.dart';

class HomeController extends GetxController {
  bool loading = false;
  List<Banner> bannerList = [];
  List<Category> category = [];
  List<Product> products = [];
  HomeRepositoryImpl homeRepositoryImpl = HomeRepositoryImpl();

  @override
  onInit() {
    super.onInit();
    banner();
    getProducts();
    getCategory();
  }

  banner() async {
    if(await isNetworkAvailable() == false) {
      ToastUtil.showToast('No internet connected');
    } else {
      update([ControllerBuilders.homeController]);
      var data = await homeRepositoryImpl.banner();
      data.fold((l) {
        if (l is ServerFailure) {
          ToastUtil.showToast(l.message);
          update([ControllerBuilders.homeController]);
        }
      }, (r) {
        if (r.status == true) {
          bannerList.addAll(r.banner ?? []);
          update([ControllerBuilders.homeController]);
        }
        else {
          update([ControllerBuilders.homeController]);
        }
      }
      );
      update([ControllerBuilders.homeController]);
    }

  }

  getCategory() async {
    if(await isNetworkAvailable() == false) {
      ToastUtil.showToast('No internet connected');
    } else {
      update([ControllerBuilders.homeController]);
      var data = await homeRepositoryImpl.category();
      data.fold((l) {
        if (l is ServerFailure) {
          ToastUtil.showToast(l.message);
          update([ControllerBuilders.homeController]);
        }
      }, (r) {
        if (r.status == true) {
          category.addAll(r.category ?? []);
          update([ControllerBuilders.homeController]);
        }
        else {
          update([ControllerBuilders.homeController]);
        }
      }
      );
      update([ControllerBuilders.homeController]);
    }

  }

  getProducts() async {
    if(await isNetworkAvailable() == false) {
      ToastUtil.showToast('No internet connected');
    } else {
      loading = true;
      update([ControllerBuilders.homeController]);
      var data = await homeRepositoryImpl.products();
      data.fold((l) {
        if (l is ServerFailure) {
          ToastUtil.showToast(l.message);
          loading = false;
          update([ControllerBuilders.homeController]);
        }
      }, (r) {
        if (r.status == true) {
          products.addAll(r.product ?? []);
          loading = false;
          update([ControllerBuilders.homeController]);
        }
        else {
          loading = false;
          update([ControllerBuilders.homeController]);
        }
      }
      );
      update([ControllerBuilders.homeController]);
    }

  }

}