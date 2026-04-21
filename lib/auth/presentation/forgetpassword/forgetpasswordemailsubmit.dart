import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/forgot_password_controller.dart';

class ForgotPasswordEmailSubmitScreen extends StatelessWidget {
  const ForgotPasswordEmailSubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller = Get.put(ForgotPasswordController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                // Top Illustration
                Center(
                  child: Image.asset(
                    'assets/images/forgetpasswordlogo.png',
                    height: 280.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 40.h),
                
                // Title
                Center(
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                
                // Description
                Center(
                  child: Text(
                    'Enter your email or phone number to reset your password',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: const Color(0xFF64748B),
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                
                // Input Label
                Text(
                  'Email or Phone',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF334155),
                  ),
                ),
                SizedBox(height: 8.h),
                
                // Email/Phone Input Field
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x33925349),
                        offset: Offset(0, 4),
                        blurRadius: 6,
                        spreadRadius: -4,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email or phone',
                      hintStyle: GoogleFonts.inter(
                        color: const Color(0xFF94A3B8),
                        fontSize: 14.sp,
                      ),
                      suffixIcon: Icon(Icons.email_outlined, size: 20.sp, color: const Color(0xFF94A3B8)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 40.h),
                
                // Send Reset Link Button
                GestureDetector(
                  onTap: () {
                    controller.sendResetLink();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFAC6B5B),
                          Color(0xFFE3A593),
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33925349),
                          offset: Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: -3,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Send Reset Link',
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
