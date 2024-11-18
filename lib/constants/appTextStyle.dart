import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_shop/constants/Dimesnions.dart';
import 'package:the_shop/constants/constants.dart';

class AppTextStyle {
  static TextStyle normalTextStyle(double fontSize, Color textColor,{FontWeight? weight,FontStyle? style,TextDecoration? decoration}) {
    return GoogleFonts.bebasNeue(
        fontSize: fontSize,
        color: textColor,
        decorationColor: primaryColor,
        decoration: decoration,
        fontStyle: style ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.w200
    );
  }

  static TextStyle themeBoldTextStyle({double? fontSize ,Color? color}) {
    return GoogleFonts.bebasNeue(
        fontSize: fontSize ?? FontSize.sp_24,
        color: color ?? Colors.black,
        fontWeight: FontWeight.bold
    );

  }
  static TextStyle themeBoldNormalTextStyle({double? fontSize ,Color? color}) {
    return  GoogleFonts.bebasNeue(
        fontSize: fontSize ?? FontSize.sp_24,
        color: color ?? Colors.black,
        fontWeight: FontWeight.w600
    );


  }
  static buttonTextStyle({Color? color,double? fontSize}) =>  GoogleFonts.bebasNeue(
      fontSize: fontSize ?? FontSize.sp_16,
      color: color ?? whiteColor,
      fontWeight: FontWeight.w500
  );

  static bodyMediumTextStyle({Color? color}) =>  GoogleFonts.bebasNeue(
      fontSize: FontSize.sp_13,
      color: color ?? Colors.black,
      fontWeight: FontWeight.w500
  );
}