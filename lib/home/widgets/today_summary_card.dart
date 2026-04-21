import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TodaySummaryCard extends StatelessWidget {
  final double score;
  final String status;

  const TodaySummaryCard({
    super.key,
    required this.score,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFF9F9FB), Color(0xFFF3F0F8)],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Summary",
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF2D3142),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              _buildScoreCircle(),
              SizedBox(width: 28.w),
              Expanded(
                child: Column(
                  children: [
                    _buildSummaryRow('Hot Flashes', '2 today'),
                    SizedBox(height: 16.h),
                    _buildSummaryRow('Sleep Quality', '6.5/10'),
                    SizedBox(height: 16.h),
                    _buildSummaryRow('Energy Level', 'Medium'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoreCircle() {
    return SizedBox(
      width: 90.w,
      height: 90.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/pai.png',
            width: 90.w,
            height: 90.h,
            fit: BoxFit.contain,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                score.toStringAsFixed(1),
                style: GoogleFonts.inter(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2D3142),
                  height: 1.1,
                ),
              ),
              Text(
                status,
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: const Color(0xFF9098A3),
                  height: 1.1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF334155),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            color: const Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }
}
