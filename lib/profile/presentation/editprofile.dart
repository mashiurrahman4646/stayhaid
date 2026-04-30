import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../core/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  height: 40.h,
                  width: 40.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.chevron_left, color: Colors.grey),
                ),
              ),
              
              SizedBox(height: 30.h),
              
              // Change Name
              _buildLabel('Change Name'),
              _buildTextField(hint: 'Type ....'),
              
              SizedBox(height: 20.h),
              
              // Current Password
              _buildLabel('Current Password'),
              _buildTextField(
                hint: 'enter your password',
                prefixIcon: Icons.lock_outline,
                suffixIcon: Icons.visibility_off_outlined,
                isPassword: true,
              ),
              
              SizedBox(height: 20.h),
              
              // New Password
              _buildLabel('New Password'),
              _buildTextField(
                hint: 'enter your password',
                prefixIcon: Icons.lock_outline,
                suffixIcon: Icons.visibility_off_outlined,
                isPassword: true,
              ),
              
              SizedBox(height: 20.h),
              
              // Confirm New Password
              _buildLabel('Confirm New Password'),
              _buildTextField(
                hint: 'enter your password',
                prefixIcon: Icons.lock_outline,
                suffixIcon: Icons.visibility_off_outlined,
                isPassword: true,
              ),
              
              SizedBox(height: 50.h),
              
              // Save Button
              Container(
                width: double.infinity,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.r),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFB57E6F),
                      Color(0xFFD69785),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFD69785).withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.r),
                    ),
                  ),
                  child: Text(
                    'save',
                    style: GoogleFonts.outfit(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: GoogleFonts.outfit(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF6B7270),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        obscureText: isPassword,
        style: GoogleFonts.outfit(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.outfit(
            color: Colors.grey[400],
            fontSize: 14.sp,
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey[400], size: 20.sp) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.grey[400], size: 20.sp) : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        ),
      ),
    );
  }
}
