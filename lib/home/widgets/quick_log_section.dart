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
              SizedBox(width: 12.w),
              _buildQuickLogItem('assets/icons/sleep.png', 'Sleep'),
              SizedBox(width: 12.w),
              _buildQuickLogItem('assets/icons/mood.png', 'Mood'),
              SizedBox(width: 12.w),
              _buildQuickLogItem('assets/icons/energy.png', 'Energy'),
              SizedBox(width: 12.w),
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
        Image.asset(
          iconPath,
          width: 100.w,
          height: 100.h,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF334155),
          ),
        ),
      ],
    );
  }
}
