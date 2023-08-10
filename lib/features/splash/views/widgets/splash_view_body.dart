import 'package:flutter/material.dart';

import '../../../../utils/app_images.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  @override
  State<SplashViewBody> createState() => _SplashViewBody();
}

class _SplashViewBody extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadingAnimation;
  @override
  void initState() {
    fadeAnimationInit();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: animationController.value,
        child: Center(
          child: Image.asset(AppImages.Klogo),
        ),
      ),
    );
  }

  void fadeAnimationInit() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 2,
        ));

    fadingAnimation =
        Tween<double>(begin: .4, end: 1).animate(animationController);
    animationController.repeat(reverse: true);

    animationController.addListener(() {
      setState(() {});
    });
  }
}
