import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickLogSection extends StatelessWidget {
  const QuickLogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Log',
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1E293B),
          ),
        ),
        SizedBox(height: 16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildQuickLogItem('assets/icons/hotflash.png', 'Hot Flash'),
              SizedBox(width: 20.w),
              _buildQuickLogItem('assets/icons/sleep.png', 'Sleep'),
              SizedBox(width: 20.w),
              _buildQuickLogItem('assets/icons/mood.png', 'Mood'),
              SizedBox(width: 20.w),
              _buildQuickLogItem('assets/icons/energy.png', 'Energy'),
              SizedBox(width: 20.w),
              _buildQuickLogItem('assets/icons/brainfog.png', 'Brain Fog'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLogItem(String iconPath, String label) {
    return Column(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: const Color(0x33FFE3D6), // Figma background
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: const Color(0xFFE5E7EB),
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              iconPath,
              width: 22.w,
              height: 22.w,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }
}
