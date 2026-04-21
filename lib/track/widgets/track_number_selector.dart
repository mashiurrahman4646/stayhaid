import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackNumberSelector extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final Color iconBg;
  final int currentVal;
  final Function(int) onSelect;

  const TrackNumberSelector({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.iconBg,
    required this.currentVal,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
                child: Center(
                  child: Image.asset(iconPath, width: 24.w, height: 24.h),
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.sora(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2D3142),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.sora(
                        fontSize: 13.sp,
                        color: const Color(0xFF9098A3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              final isSelected = currentVal == index;
              return GestureDetector(
                onTap: () => onSelect(index),
                child: Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? const Color(0xFFAC6B5B) : const Color(0xFFE5E7EB),
                      width: isSelected ? 2 : 1,
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      index == 5 ? '5+' : '$index',
                      style: GoogleFonts.sora(
                        fontSize: 14.sp,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected ? const Color(0xFFAC6B5B) : const Color(0xFF9098A3),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
