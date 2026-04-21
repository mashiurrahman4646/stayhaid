import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/app_colors.dart';
import '../../../core/approut.dart';
import '../../controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                // Name Field
                _buildLabel('Name'),
                SizedBox(height: 8.h),
                _buildTextField(
                  controller: controller.nameController,
                  hintText: 'Jhon',
                ),
                
                SizedBox(height: 20.h),
                
                // Phone Number Field
                _buildLabel('Phone Number'),
                SizedBox(height: 8.h),
                _buildTextField(
                  controller: controller.phoneController,
                  hintText: '+014576...',
                ),
                
                SizedBox(height: 20.h),
                
                // Email Field
                _buildLabel('Email'),
                SizedBox(height: 8.h),
                _buildTextField(
                  controller: controller.emailController,
                  hintText: 'Enter your email',
                ),
                
                SizedBox(height: 20.h),
                
                // Password Field
                _buildLabel('Password'),
                SizedBox(height: 8.h),
                Obx(() => _buildTextField(
                  controller: controller.passwordController,
                  hintText: 'Enter your password',
                  obscureText: !controller.isPasswordVisible.value,
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      size: 20.sp,
                      color: const Color(0xFF1E293B),
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                )),
                
                SizedBox(height: 20.h),
                
                // Address Field
                _buildLabel('Address'),
                SizedBox(height: 8.h),
                _buildTextField(
                  controller: controller.addressController,
                  hintText: 'Enter your address',
                ),
                
                SizedBox(height: 40.h),
                
                // Sign Up Button
                GestureDetector(
                  onTap: () {
                    controller.signup();
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
                        'Sign Up',
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
                
                // Login Link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF1E293B),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            fontSize: 14.sp,
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
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF1E293B),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    IconData? prefixIcon,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -4,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            color: const Color(0xFF94A3B8),
            fontSize: 14.sp,
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 20.sp, color: const Color(0xFF1E293B)) : null,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          filled: true,
          fillColor: const Color(0xFFF8FAFC),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
