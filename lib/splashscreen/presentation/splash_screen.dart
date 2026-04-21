import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/app_colors.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the SplashController
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Center(
        child: Image.asset(
          'assets/images/splachscreen.png',
          // Adjust width so the image looks good on the screen
          width: Get.width * 0.85, 
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
