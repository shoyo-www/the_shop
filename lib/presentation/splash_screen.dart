import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:the_shop/constants/Dimesnions.dart';
import 'package:the_shop/constants/constants%202.dart';
import 'package:the_shop/data/datasource/local/local_storage.dart';
import 'package:the_shop/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _loadWidget();
    super.initState();
  }

  _loadWidget() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, _checkSignInStatus);
  }

  _checkSignInStatus() {
    if(LocalStorage.getBool(GetXStorageConstants.isLogin) == true) {
      Get.toNamed(AppRoutes.dashBoard);
    } else {
      Get.toNamed(AppRoutes.login);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: SvgPicture.asset(
          "assets/logo/Shoplon.svg",
          colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!, BlendMode.srcIn),
          height: Dimensions.h_30,
          width: Dimensions.w_100,
        ),
      ),
    );
  }
}
