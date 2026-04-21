import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyInsightCard extends StatelessWidget {
  const DailyInsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 82.h,
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFE2E8F0).withOpacity(0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFFC107).withOpacity(0.25),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lightbulb_outline,
              size: 22.sp,
              color: const Color(0xFFF59E0B),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Daily Insight',
                  style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Your sleep quality has improved 15% this week...',
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: const Color(0xFF64748B),
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
