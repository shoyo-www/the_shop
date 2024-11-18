import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:the_shop/constants/constants%202.dart';
import 'package:the_shop/core/error/failures.dart';
import 'package:the_shop/data/datasource/Repository_impl/auth_repository_impl.dart';
import 'package:the_shop/data/datasource/remote/request/register_request.dart';
import 'package:the_shop/widgets/snackbar.dart';

class RegisterController extends GetxController {
  bool loading = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  TextEditingController fullNameCont = TextEditingController();
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  register() async {
    if(await isNetworkAvailable() == false) {
      ToastUtil.showToast('No internet connected');
    } else {
      loading = true;
      update([ControllerBuilders.registerController]);
      var request = RegisterRequest(fullName: fullNameCont.text.trim(),email: emailCont.text.trim(), password: passCont.text.trim());
      var data = await authRepositoryImpl.register(request);
      data.fold((l) {
        if (l is ServerFailure) {
          ToastUtil.showToast(l.message);
          loading = false;
          update([ControllerBuilders.registerController]);
        }
      }, (r) {
        if (r.status == true) {
          ToastUtil.showToast(r.msg ?? '');
          loading = false;
          Get.back();
          emailCont.clear();
          passCont.clear();
          fullNameCont.clear();
          update([ControllerBuilders.registerController]);
        }
        else {
          loading = false;
          update([ControllerBuilders.registerController]);
        }
      }
      );
      update([ControllerBuilders.loginController]);
    }

  }

}