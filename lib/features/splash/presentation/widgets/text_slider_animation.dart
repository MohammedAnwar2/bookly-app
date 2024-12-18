import 'package:bookly_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class TextSliderAnimation extends StatelessWidget {
  const TextSliderAnimation({
    super.key,
    required this.sliderAnimation,
  });

  final Animation<Offset> sliderAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: sliderAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: sliderAnimation,
          child: Text("Reed Free Books",
              style: AppStyles.styleRegular12(context),
              textAlign: TextAlign.center),
        );
      },
    );
  }
}
