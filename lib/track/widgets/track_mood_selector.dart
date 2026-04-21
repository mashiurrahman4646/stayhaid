import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackMoodSelector extends StatelessWidget {
  final int selectedMood;
  final Function(int) onSelect;

  const TrackMoodSelector({
    super.key,
    required this.selectedMood,
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
                decoration: const BoxDecoration(color: Color(0xFFF3E5F5), shape: BoxShape.circle),
                child: Center(
                  child: Image.asset('assets/icons/moods.png', width: 24.w, height: 24.h),
                ),
              ),
              SizedBox(width: 14.w),
              Text(
                'Mood',
                style: GoogleFonts.sora(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2D3142),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(child: _buildMoodCard(0, 'Low', Icons.sentiment_very_dissatisfied, const Color(0xFFF9FAFB))),
              SizedBox(width: 10.w),
              Expanded(child: _buildMoodCard(1, 'Okay', Icons.sentiment_neutral, const Color(0xFFFFF0EB))),
              SizedBox(width: 10.w),
              Expanded(child: _buildMoodCard(2, 'Good', Icons.sentiment_very_satisfied, const Color(0xFFF9FAFB))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMoodCard(int index, String label, IconData icon, Color activeBg) {
    final isSelected = selectedMood == index;
    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: isSelected ? activeBg : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? const Color(0xFFAC6B5B).withOpacity(0.3) : const Color(0xFFE5E7EB),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 32.sp,
              color: isSelected ? const Color(0xFFAC6B5B) : const Color(0xFF9098A3),
            ),
            SizedBox(height: 10.h),
            Text(
              label,
              style: GoogleFonts.sora(
                fontSize: 13.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? const Color(0xFFAC6B5B) : const Color(0xFF9098A3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
