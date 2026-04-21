import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/app_colors.dart';
import '../../controller/signup_otp_controller.dart';

class SignupOtpPage extends StatelessWidget {
  const SignupOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupOtpController controller = Get.put(SignupOtpController());

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                // Logo
                Center(
                  child: Image.asset(
                    'assets/images/otplogo.png',
                    height: 150.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 32.h),
                
                // Title
                Text(
                  'Verify OTP',
                  style: GoogleFonts.inter(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: 12.h),
                
                // Description
                Text(
                  'Enter the 4-digit code sent to your\nphone number',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: const Color(0xFF64748B),
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 16.h),
                
                // Phone Number
                Text(
                  '+1 (555) 123-4567',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFD69785),
                  ),
                ),
                SizedBox(height: 40.h),
                
                // OTP Input Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => _buildOtpBox(index, controller),
                  ),
                ),
                SizedBox(height: 40.h),
                
                // Verify Button
                GestureDetector(
                  onTap: () {
                    controller.verifyCode();
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
                        'Verify Code',
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                
                // Resend Link
                Text(
                  "Didn't receive the code?",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: const Color(0xFF64748B),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () {
                    // Handle resend
                  },
                  child: Text(
                    'Resend Code',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFD69785),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                
                // Expiry Timer
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDE1D3),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.access_time_filled, size: 20.sp, color: const Color(0xFF64748B)),
                      SizedBox(width: 8.w),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: const Color(0xFF64748B),
                          ),
                          children: [
                            const TextSpan(text: 'Code expires in '),
                            TextSpan(
                              text: '01:55',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFD69785),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

  Widget _buildOtpBox(int index, SignupOtpController controller) {
    return Container(
      width: 70.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: controller.controllers[index],
          focusNode: controller.focusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: GoogleFonts.inter(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFAC6B5B),
          ),
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
            hintText: '-',
            hintStyle: TextStyle(color: Color(0xFFCBD5E1)),
          ),
          onChanged: (value) {
            if (value.isNotEmpty && index < 3) {
              controller.focusNodes[index + 1].requestFocus();
            } else if (value.isEmpty && index > 0) {
              controller.focusNodes[index - 1].requestFocus();
            }
          },
        ),
      ),
    );
  }
}
