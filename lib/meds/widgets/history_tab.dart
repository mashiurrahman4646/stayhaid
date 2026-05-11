import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/app_colors.dart';
import '../controller/meds_controller.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MedsController>();

    return Obx(() {
      final dates = controller.history.keys.toList()..sort((a, b) => b.compareTo(a));
      
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          final records = controller.history[date]!;
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 16.sp, color: const Color(0xFF1A1C1E)),
                        SizedBox(width: 8.w),
                        Text(
                          DateFormat('EEE, MMM d').format(date),
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1A1C1E),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        '${records.length}/${records.length} taken',
                        style: GoogleFonts.outfit(
                          fontSize: 12.sp,
                          color: AppColors.subtitleText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: records.asMap().entries.map((entry) {
                    final record = entry.value;
                    final isLast = entry.key == records.length - 1;
                    return _buildHistoryItem(record, isLast);
                  }).toList(),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          );
        },
      );
    });
  }

  Widget _buildHistoryItem(dynamic record, bool isLast) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: isLast ? null : const Border(bottom: BorderSide(color: Color(0xFFF1F1F1))),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: Color(0xFFE6F7F0),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: const Color(0xFFD3917D), size: 18.sp), // Using theme color for check
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.medicationName,
                  style: GoogleFonts.outfit(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1C1E),
                  ),
                ),
                Text(
                  'Scheduled for ${DateFormat('h:mm a').format(record.scheduledTime)}',
                  style: GoogleFonts.outfit(
                    fontSize: 12.sp,
                    color: AppColors.subtitleText,
                  ),
                ),
              ],
            ),
          ),
          Text(
            DateFormat('h:mm a').format(record.takenTime),
            style: GoogleFonts.outfit(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFD69785),
            ),
          ),
        ],
      ),
    );
  }
}
