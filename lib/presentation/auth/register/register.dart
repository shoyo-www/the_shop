import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_shop/constants/Dimesnions.dart';
import 'package:the_shop/constants/appTextStyle.dart';
import 'package:the_shop/constants/constants%202.dart';
import 'package:the_shop/constants/constants.dart';
import 'package:the_shop/presentation/auth/register/register_controller.dart';
import 'package:the_shop/widgets/appbutton.dart';
import 'package:the_shop/widgets/validators.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return GetBuilder(
      id: ControllerBuilders.registerController,
      init: controller,
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/signUp_dark.png",
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let’s get started!",
                        style: AppTextStyle.normalTextStyle(FontSize.sp_24, blackColor),
                      ),
                      const SizedBox(height: defaultPadding + defaultPadding),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              onSaved: (emal) {
                                // Email
                              },
                              controller: controller.fullNameCont,
                              validator: Validator.fullName.call,
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
                                hintText: "Full Name",
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
                              onSaved: (emal) {
                                // Email
                              },
                              validator: Validator.emailValidate.call,
                              autovalidateMode: AutovalidateMode.onUnfocus,
                              controller: controller.emailCont,
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
                              onSaved: (pass) {
                                // Password
                              },
                              controller: controller.passCont,
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
                       AppButton(loading: controller.loading,title: 'Register',onTap: () {
                         if(controller.formKey.currentState!.validate()) {
                           controller.register();
                         }
                       },),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" have an account?",style: GoogleFonts.bebasNeue(
                            color: blackColor,
                            fontSize: FontSize.sp_15,
                          ),),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child:  Text("Sign In",style: GoogleFonts.bebasNeue(
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
