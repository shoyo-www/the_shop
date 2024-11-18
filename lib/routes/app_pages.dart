import 'package:get/get.dart';
import 'package:the_shop/presentation/auth/login/login.dart';
import 'package:the_shop/presentation/auth/register/register.dart';
import 'package:the_shop/presentation/entry/entry_point.dart';
import 'package:the_shop/presentation/onboarding/onboarding.dart';
import 'package:the_shop/presentation/splash_screen.dart';
import 'package:the_shop/routes/app_routes.dart';

class AppPages {
  static const Duration duration = Duration(milliseconds: 800);
  static const Transition transition = Transition.cupertino;
  static var list = [
    GetPage(
        name: AppRoutes.splashScreen,
        page: ()=>const SplashScreen(),
        transition: transition,
        transitionDuration: duration
    ),
    GetPage(
        name: AppRoutes.onBoarding,
        page: ()=>const OnBordingScreen(),
        transition: transition,
        transitionDuration: duration
    ),
    GetPage(
        name: AppRoutes.login,
        page: ()=>const LoginScreen(),
        transition: transition,
        transitionDuration: duration
    ),
    GetPage(
        name: AppRoutes.register,
        page: ()=>const RegisterScreen(),
        transition: transition,
        transitionDuration: duration
    ),
    GetPage(
        name: AppRoutes.dashBoard,
        page: ()=>const EntryPoint(),
        transition: transition,
        transitionDuration: duration
    ),
  ];
}
