import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:the_shop/constants/constants%202.dart';
import 'package:the_shop/core/error/failures.dart';
import 'package:the_shop/data/datasource/Repository_impl/auth_repository_impl.dart';
import 'package:the_shop/data/datasource/local/local_storage.dart';
import 'package:the_shop/data/datasource/remote/request/login_request.dart';
import 'package:the_shop/routes/app_routes.dart';
import 'package:the_shop/widgets/snackbar.dart';

class LoginController extends GetxController {
  bool loading = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login() async {
    if(await isNetworkAvailable() == false) {
      ToastUtil.showToast('No internet connected');
    } else {
      loading = true;
      update([ControllerBuilders.loginController]);
      var request = LoginRequest(email: emailCont.text.trim(), password: passCont.text.trim());
      var data = await authRepositoryImpl.login(request);
      data.fold((l) {
        if (l is ServerFailure) {
          ToastUtil.showToast(l.message);
          loading = false;
          update([ControllerBuilders.loginController]);
        }
      }, (r) {
        if (r.status == true) {
          loading = false;
          LocalStorage.setAuthToken(r.token ?? '');
          LocalStorage.writeBool(GetXStorageConstants.isLogin, true);
          Get.offNamed(AppRoutes.dashBoard);
          emailCont.clear();
          passCont.clear();
          update([ControllerBuilders.loginController]);
        }
        else {
          loading = false;
          update([ControllerBuilders.loginController]);

        }
      }
      );
      update([ControllerBuilders.loginController]);
    }

  }

}