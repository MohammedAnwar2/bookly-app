import 'package:bookly_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 1200) {
    return width / 1000;
  } else {
    return width / 1500;
  }
}

abstract class AppStyles {
  static TextStyle styleAguDisplayRegular70(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 70),
      fontFamily: kFontFamilyAguDisplay,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleAguDisplayRegular20(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: kFontFamilyAguDisplay,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular12(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: kFontFamilyMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBolde18(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: kFontFamilyMontserrat,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBolde20(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: kFontFamilyMontserrat,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBolde16(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: kFontFamilyMontserrat,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular20(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: kFontFamilyMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold25(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 25),
      fontFamily: kFontFamilyMontserrat,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleMedium14(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: kFontFamilyMontserrat,
      fontWeight: FontWeight.w500,
    );
  }
}
