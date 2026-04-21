import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeInfoTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String? subtitle;

  const HomeInfoTile({
    super.key,
    required this.iconPath,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0).withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 100.w,
            height: 100.h,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    subtitle!,
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            size: 22.sp,
            color: const Color(0xFFCBD5E1),
          ),
        ],
      ),
    );
  }
}
