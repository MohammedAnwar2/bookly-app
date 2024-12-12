import 'package:bookly_app/core/utils/constants/app_size_config.dart';
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
  if (width < SizeConfig.tablet) {
    return width / 400;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1500;
  }
}

abstract class AppStyles {
  AppStyles._();
  static TextStyle styleIBMRegular70(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 70),
      fontFamily: 'AguDisplay',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleInconsolataRegular12(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Inconsolata',
      fontWeight: FontWeight.w400,
    );
  }
}
