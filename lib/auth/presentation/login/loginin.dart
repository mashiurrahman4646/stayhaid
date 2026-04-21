import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/app_colors.dart';
import '../../../core/approut.dart';
import '../../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              // Top Illustration
              Center(
                child: Image.asset(
                  'assets/images/loginlogo.png',
                  height: 280.h,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 100.h),
                ),
              ),
              SizedBox(height: 40.h),
              
              // Email Field Label
              Text(
                'Email or Phone',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF334155),
                ),
              ),
              SizedBox(height: 8.h),
              // Email TextField with Shadow
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
              
              SizedBox(height: 24.h),
              
              // Password Field Label
              Text(
                'Password',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF334155),
                ),
              ),
              SizedBox(height: 8.h),
              // Password TextField with Shadow
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
                child: Obx(() => TextField(
                  controller: controller.passwordController,
                  obscureText: !controller.isPasswordVisible.value,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: GoogleFonts.inter(
                      color: const Color(0xFF94A3B8),
                      fontSize: 14.sp,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        size: 20.sp,
                        color: const Color(0xFF94A3B8),
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
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
                )),
              ),
              
              // Forgot Password with Border Bottom
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.forgotPassword);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFFF6B6B), width: 0.5),
                      ),
                    ),
                    child: Text(
                      'Forgot password?',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: const Color(0xFFFF6B6B),
                      ),
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 24.h),
              
              // Login Button
              GestureDetector(
                onTap: () {
                  controller.login();
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
                      'Login',
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 32.h),
              
              // Sign Up Text with Border Bottom
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.signup);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xFF897070), width: 0.5),
                          ),
                        ),
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF897070),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
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
    );
  }
}
