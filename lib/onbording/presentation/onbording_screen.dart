import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_colors.dart';
import '../../core/approut.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.onboardingGradientTop,
              AppColors.onboardingGradientBottom,
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),

              // Main Onboarding Image
              Image.asset(
                'assets/images/onbording.png',
                height: 350.h,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 40.h),

              // Welcome Title
              Text(
                'Welcome',
                style: GoogleFonts.lora(
                  color: AppColors.primaryAction,
                  fontSize: 42.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),

              SizedBox(height: 16.h),

              // Subtitle
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.w),
                child: Text(
                  'Discover Balance, Vitality, and\nConfidence in Your Unique Journey',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: AppColors.subtitleText,
                    fontSize: 15.sp,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const Spacer(),

              // Get Started Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
                child: Container(
                  height: 56.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryAction,
                    borderRadius: BorderRadius.circular(28.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryAction.withOpacity(0.3),
                        blurRadius: 15.r,
                        offset: Offset(0, 8.h),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.login);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
