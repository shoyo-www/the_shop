import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_shop/constants/Dimesnions.dart';
import 'package:the_shop/constants/constants%202.dart';
import 'package:the_shop/constants/constants.dart';
import 'package:the_shop/presentation/auth/login/login_controller.dart';
import 'package:the_shop/routes/app_routes.dart';
import 'package:the_shop/widgets/appbutton.dart';
import 'package:the_shop/widgets/validators.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    LoginController loginController = Get.put(LoginController());
    return GetBuilder(
      init: loginController,
      id: ControllerBuilders.loginController,
      builder: ( controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_dark.png",
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: GoogleFonts.bebasNeue(
                          color: blackColor,
                          fontSize: FontSize.sp_24,
                        ),
                      ),
                      const SizedBox(height: defaultPadding + defaultPadding),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: controller.emailCont,
                              onSaved: (emal) {
                                // Email
                              },
                              validator: Validator.emailValidate.call,
                              autovalidateMode: AutovalidateMode.onUnfocus,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                enabledBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.h_8),
                                    borderSide: const BorderSide(
                                        color: greyColor,
                                        width: 0.5
                                    )
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.h_8),
                                    borderSide: const BorderSide(
                                        color: greyColor,
                                        width: 0.5
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.h_8),
                                    borderSide: const BorderSide(
                                        color: greyColor,
                                        width: 0.5
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.h_8),
                                    borderSide: const BorderSide(
                                        color: greyColor,
                                        width: 0.5
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.h_8),
                                    borderSide: const BorderSide(
                                        color: greyColor,
                                        width: 0.5
                                    )
                                ),
                                hintText: "Email address",
                                hintStyle: TextStyle(
                                    color: greyColor,
                                    fontSize: FontSize.sp_14
                                ),
                                prefixIcon: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                                  child: SvgPicture.asset(
                                    "assets/icons/Message.svg",
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color!
                                            .withOpacity(0.3),
                                        BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              controller: controller.passCont,
                              onSaved: (pass) {
                                // Password
                              },
                              obscureText: true,
                              validator: Validator.passwordValidate.call,
                              autovalidateMode: AutovalidateMode.onUnfocus,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.h_8),
                                    borderSide: const BorderSide(
                                        color: lightGreyColor,
                                        width: 0.5
                                    )
                                ),
                                enabledBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.h_8),
                                    borderSide: const BorderSide(
                                        color: greyColor,
                                        width: 0.5
                                    )
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.h_8),
                                    borderSide: const BorderSide(
                                        color: greyColor,
                                        width: 0.5
                                    )
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.h_8),
                                    borderSide: const BorderSide(
                                        color: greyColor,
                                        width: 0.5
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.h_8),
                                    borderSide: const BorderSide(
                                        color: greyColor,
                                        width: 0.5
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.h_8),
                                    borderSide: const BorderSide(
                                        color: greyColor,
                                        width: 0.5
                                    )
                                ),

                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: greyColor,
                                    fontSize: FontSize.sp_14
                                ),
                                prefixIcon: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                                  child: SvgPicture.asset(
                                    "assets/icons/Lock.svg",
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color!
                                            .withOpacity(0.3),
                                        BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      const SizedBox(height: defaultPadding * 2),
                      AppButton(loading: controller.loading,title: 'Login',onTap: () {
                        if(_formKey.currentState!.validate()) {
                          controller.login();
                        }
                      },),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",style: GoogleFonts.bebasNeue(
                            color: blackColor,
                            fontSize: FontSize.sp_15,
                          ),),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.register);
                            },
                            child:  Text("Sign up",style: GoogleFonts.bebasNeue(
                                fontSize: FontSize.sp_15
                            ),),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
