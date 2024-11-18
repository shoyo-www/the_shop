import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_shop/presentation/onboarding/onboarding.dart';
import 'package:the_shop/routes/app_routes.dart';

import 'constants/Dimesnions.dart';
import 'di/di.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: [
    SystemUiOverlay.top,
    SystemUiOverlay.bottom
  ]);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        return ScreenUtilInit(
          designSize: const Size(
              Dimensions.defaultWidth,
              Dimensions.deviceHeight),
          minTextAdapt: false,
          ensureScreenSize: true,
          useInheritedMediaQuery: true,
          builder: (BuildContext context, Widget? child) {
            return GetMaterialApp(
              initialBinding: InitialBinding(),
              debugShowCheckedModeBanner: false,
              title: "Shoplon",
              initialRoute:  AppRoutes.splashScreen,
              getPages: AppPages.list,
            );
          },
        );
      }
  }


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }
}