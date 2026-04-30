import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../core/approut.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

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
          'Help & Support',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Cards
            Row(
              children: [
                Expanded(
                  child: _buildInfoCard(
                    iconPath: 'assets/icons/AccountIssues.png',
                    title: 'Account Issues',
                    subtitle: 'Login & settings',
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildInfoCard(
                    iconPath: 'assets/icons/TrackingHelp.png',
                    title: 'Tracking Help',
                    subtitle: 'Cycle & symptoms',
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 30.h),
            
            Text(
              'Frequently Asked',
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A2E35),
              ),
            ),
            
            SizedBox(height: 16.h),
            
            // FAQ List
            _buildFAQTile('How do I track my cycle accurately?'),
            _buildFAQTile('Can I sync data across devices?'),
            _buildFAQTile('How to set medication reminders?'),
            _buildFAQTile('What\'s included in premium?'),
            
            SizedBox(height: 30.h),
            
            Text(
              'Contact Us',
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A2E35),
              ),
            ),
            
            SizedBox(height: 16.h),
            
            // Chat Button
            _buildContactButton(
              text: 'Chat with us',
              isPrimary: true,
              onTap: () => Get.toNamed(AppRoute.chatSupport),
            ),
            
            SizedBox(height: 12.h),
            
            // Email Button
            _buildContactButton(
              text: 'Email Support',
              isPrimary: false,
              icon: Icons.email_outlined,
              onTap: () => Get.toNamed(AppRoute.emailSupport),
            ),
            
            SizedBox(height: 20.h),
            
            Center(
              child: Text(
                'We typically respond within 2-4 hours',
                style: GoogleFonts.outfit(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String iconPath, required String title, required String subtitle}) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFDECE8).withOpacity(0.4),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(iconPath, width: 22.w, height: 22.w),
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A2E35),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: GoogleFonts.outfit(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQTile(String question) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ListTile(
        title: Text(
          question,
          style: GoogleFonts.outfit(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A2E35),
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[400], size: 20.sp),
        onTap: () {},
      ),
    );
  }

  Widget _buildContactButton({
    required String text,
    required bool isPrimary,
    IconData? icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: isPrimary ? null : const Color(0xFFFDECE8).withOpacity(0.4),
          gradient: isPrimary
              ? const LinearGradient(
                  colors: [Color(0xFFB57E6F), Color(0xFFD69785)],
                )
              : null,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: const Color(0xFFD69785).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: const Color(0xFFD3917D), size: 20.sp),
              SizedBox(width: 8.w),
            ],
            Text(
              text,
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: isPrimary ? Colors.white : const Color(0xFFD3917D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
