import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_shop/constants/Dimesnions.dart';

import '../constants/constants.dart';

class AppButton extends StatelessWidget {
  final double? height;
  final EdgeInsetsGeometry? margin;
  final String title;
  final double? borderRadius;
  final bool loading ;
  final  TextStyle? style;
  final void Function()? onTap;
  const AppButton({super.key, this.style,this.height,this.borderRadius, this.margin, required this.title, this.onTap, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      child: Container(
          margin: margin ?? EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10,top: Dimensions.h_10),
          height: height ?? Dimensions.h_40,
          width: double.infinity,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius:  BorderRadius.circular(borderRadius ?? Dimensions.h_25)
          ),
          child: Center(child: loading ? const CupertinoActivityIndicator(
            color: whiteColor,
          ) : Text(title, style: GoogleFonts.bebasNeue(
            color: whiteColor,
            fontSize: FontSize.sp_16,
          )))
      ),
    );
  }

}
