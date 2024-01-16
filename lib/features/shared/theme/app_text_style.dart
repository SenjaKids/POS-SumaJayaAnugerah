import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';

class SJATextStyle {
  static TextStyle titleL({Color? color}) => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color ?? AppColor.blue_1,
      );
  static TextStyle titleM({Color? color}) => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color ?? AppColor.blue_1,
      );
  static TextStyle titleS({Color? color}) => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: color ?? AppColor.blue_1,
      );
  static TextStyle subheadM({Color? color}) => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? AppColor.blue_1,
      );
  static TextStyle bodyL({Color? color}) => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: color ?? AppColor.blue_1,
      );
  static TextStyle bodyM({Color? color}) => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? AppColor.blue_1,
      );
  static TextStyle bodyS({Color? color}) => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color ?? AppColor.blue_1,
      );
}
