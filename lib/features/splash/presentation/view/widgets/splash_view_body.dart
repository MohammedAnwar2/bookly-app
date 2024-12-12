import 'package:bookly_app/core/utils/constants/app_style.dart';
import 'package:bookly_app/core/utils/constants/constants.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/splash/presentation/view/widgets/text_slider_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> sliderAnimation;
  @override
  void initState() {
    initSlidingAnimation();

    navigateToHome();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Bookly",
            style: AppStyles.styleAguDisplayRegular70(context),
            textAlign: TextAlign.center),
        const SizedBox(height: 8),
        TextSliderAnimation(sliderAnimation: sliderAnimation)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    sliderAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAll(() => const HomeView(),
            transition: Transition.fadeIn, duration: kTransationDuration);
      },
    );
  }
}
