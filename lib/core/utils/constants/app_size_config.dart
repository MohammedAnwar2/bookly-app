class SizeConfig {
  static double tablet = 600;
  static double desktop = 1200;

  // static double calculateResponsiveSize(BuildContext context,
  //     {required double minSize,
  //     required double maxSize,
  //     required double multiplier}) {
  //   double screenWidth = MediaQuery.sizeOf(context).width;
  //   double calculatedSize = screenWidth * multiplier;
  //   return calculatedSize.clamp(minSize, maxSize);
  // }

  // static double sizeOfIcon(BuildContext context) {
  //   double width = MediaQuery.sizeOf(context).width;
  //   if (tablet > width) {
  //     return 20;
  //   } else if (desktop > width) {
  //     return 25;
  //   } else {
  //     return 30;
  //   }
  // }
}
