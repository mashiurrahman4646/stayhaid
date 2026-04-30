import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Container(
            padding: EdgeInsets.all(8.r),
            decoration: const BoxDecoration(
              color: Color(0xFFFDECE8),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Color(0xFFD3917D)),
          ),
        ),
        title: Text(
          'Terms & Conditions',
          style: GoogleFonts.outfit(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A2E35),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                iconPath: 'assets/icons/UserAgreement.png',
                title: '1. User Agreement',
                content: 'By using our women\'s health tracking application, you agree to these terms and conditions. This agreement governs your use of our services and features.\n\nYou must be at least 18 years old to use this application. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.',
              ),
              const Divider(height: 40),
              _buildSection(
                iconPath: 'assets/icons/MedicalDisclaimer.png',
                title: '2. Medical Disclaimer',
                content: 'This application is for informational purposes only and is not intended to replace professional medical advice, diagnosis, or treatment.\n\nAlways seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition. Never disregard professional medical advice or delay in seeking it because of something you have read in this application.\n\nThe information provided is not intended to diagnose, treat, cure, or prevent any disease or health condition.',
              ),
              const Divider(height: 40),
              _buildSection(
                iconPath: 'assets/icons/DataUsage.png',
                title: '3. Data Usage',
                content: 'We collect and use your health data to provide personalized tracking and insights. Your data is encrypted and stored securely on our servers.\n\nWe do not sell your personal health information to third parties. Data may be shared with healthcare providers only with your explicit consent.\n\nYou have the right to access, modify, or delete your data at any time through your account settings.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String iconPath, required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: const BoxDecoration(
                color: Color(0xFFFDECE8),
                shape: BoxShape.circle,
              ),
              child: Image.asset(iconPath, width: 22.w, height: 22.w),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.outfit(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A2E35),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          content,
          style: GoogleFonts.outfit(
            fontSize: 14.sp,
            color: const Color(0xFF5A6F65),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
