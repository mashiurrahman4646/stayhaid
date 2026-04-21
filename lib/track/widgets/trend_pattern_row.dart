import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendPatternRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Color> gradientColors;
  final double percentage;

  const TrendPatternRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.gradientColors,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.sora(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2D3142),
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.sora(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF9098A3),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Stack(
          children: [
            Container(
              height: 12.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            FractionallySizedBox(
              widthFactor: percentage,
              child: Container(
                height: 12.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientColors),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
