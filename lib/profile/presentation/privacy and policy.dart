import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          'Privacy Policy',
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
        child: Column(
          children: [
            _buildSection(
              iconPath: 'assets/icons/PrivacyMatters.png',
              title: 'Your Privacy Matters',
              content: 'We are committed to protecting your personal health information. This policy explains how we collect, use, and safeguard your data.\n\nLast updated: March 24, 2026',
            ),
            SizedBox(height: 16.h),
            _buildSection(
              iconPath: 'assets/icons/DataCollection.png',
              title: 'Data Collection',
              content: 'Information We Collect\n'
                  '• Personal health data including cycle tracking, symptoms, and medication logs\n'
                  '• Account information such as name, email, and date of birth\n'
                  '• Device and usage data to improve app performance',
            ),
            SizedBox(height: 16.h),
            _buildSection(
              iconPath: 'assets/icons/RecordSecurity.png',
              title: 'Medical Record Security',
              content: 'Your health data is encrypted using industry-standard AES-256 encryption both in transit and at rest.\n\n'
                  'Security Measures\n'
                  '• End-to-end encryption for all medical records\n'
                  '• Regular security audits and penetration testing\n'
                  '• Two-factor authentication available for account access\n'
                  '• Secure cloud storage with HIPAA-compliant providers',
            ),
            SizedBox(height: 16.h),
            _buildSection(
              iconPath: 'assets/icons/ContactUs.png',
              title: 'Contact Us',
              content: 'If you have questions about this privacy policy or your data:\n\n'
                  '📧 privacy@mirandahealth.com\n'
                  '📞 1-800-MIRANDA',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String iconPath, required String title, required String content}) {
    return Container(
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A2E35),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            content,
            style: GoogleFonts.outfit(
              fontSize: 14.sp,
              color: const Color(0xFF5A6F65),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
