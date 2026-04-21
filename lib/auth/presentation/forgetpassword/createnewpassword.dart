import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/create_new_password_controller.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateNewPasswordController controller = Get.put(CreateNewPasswordController());

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
                // Title
                Center(
                  child: Text(
                    'Create New Password',
                    style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                
                // Subtitle
                Center(
                  child: Text(
                    'Choose a strong password to\nsecure your account',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: const Color(0xFF64748B),
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                
                // New Password Label
                _buildLabel('New Password'),
                SizedBox(height: 8.h),
                // New Password Field
                Obx(() => _buildTextField(
                  controller: controller.passwordController,
                  hintText: 'Enter your password',
                  obscureText: !controller.isPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      size: 20.sp,
                      color: const Color(0xFF94A3B8),
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                )),
                
                SizedBox(height: 20.h),
                
                // Confirm New Password Label
                _buildLabel('Confirm New Password'),
                SizedBox(height: 8.h),
                // Confirm Password Field
                Obx(() => _buildTextField(
                  controller: controller.confirmPasswordController,
                  hintText: 'Enter your password',
                  obscureText: !controller.isConfirmPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPasswordVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      size: 20.sp,
                      color: const Color(0xFF94A3B8),
                    ),
                    onPressed: controller.toggleConfirmPasswordVisibility,
                  ),
                )),
                
                SizedBox(height: 24.h),
                
                // Password Requirements
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password must contain:',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      _buildRequirementItem('At least 8 characters'),
                      _buildRequirementItem('One uppercase letter'),
                      _buildRequirementItem('One number'),
                      _buildRequirementItem('One special character'),
                    ],
                  ),
                ),
                
                SizedBox(height: 40.h),
                
                // Confirm Button
                GestureDetector(
                  onTap: () {
                    controller.confirmPassword();
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
                        'Confirm',
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

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF334155),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
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
          suffixIcon: suffixIcon,
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
    );
  }

  Widget _buildRequirementItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: const BoxDecoration(
              color: Color(0xFFD69785),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}
