import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/app_colors.dart';
import '../controller/meds_controller.dart';

class TodayTab extends StatelessWidget {
  const TodayTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MedsController>();

    return Obx(() => ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          itemCount: controller.medications.length,
          itemBuilder: (context, index) {
            final med = controller.medications[index];
            final time = DateFormat('h:mm a').format(DateTime(
              0, 0, 0, med.dosingTimes.first.hour, med.dosingTimes.first.minute));
            
            return _buildMedItem(
              time: time,
              name: med.name,
              dosage: med.dosage,
              iconPath: med.iconPath,
              isTaken: controller.todayRecords['${med.id}_$time'] ?? false,
              onTake: () => controller.markAsTaken('${med.id}_$time'),
            );
          },
        ));
  }

  Widget _buildMedItem({
    required String time,
    required String name,
    required String dosage,
    required String iconPath,
    required bool isTaken,
    required VoidCallback onTake,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Image.asset(iconPath, width: 24.w, height: 24.h),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: GoogleFonts.outfit(
                    fontSize: 12.sp,
                    color: AppColors.subtitleText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  name,
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1C1E),
                  ),
                ),
                Text(
                  dosage,
                  style: GoogleFonts.outfit(
                    fontSize: 13.sp,
                    color: AppColors.subtitleText,
                  ),
                ),
              ],
            ),
          ),
          if (isTaken)
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: const BoxDecoration(
                color: Color(0xFFE6F7F0),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, color: const Color(0xFF2CC483), size: 20.sp),
            )
          else
            GestureDetector(
              onTap: onTake,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFD69785), Color(0xFFE2A492)],
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFD69785).withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  'Take',
                  style: GoogleFonts.outfit(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
