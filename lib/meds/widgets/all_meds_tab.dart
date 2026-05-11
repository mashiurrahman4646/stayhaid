import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/app_colors.dart';
import '../controller/meds_controller.dart';
import 'add_medication_modal.dart';

class AllMedsTab extends StatelessWidget {
  const AllMedsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MedsController>();

    return Column(
      children: [
        Expanded(
          child: Obx(() => ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                itemCount: controller.medications.length,
                itemBuilder: (context, index) {
                  final med = controller.medications[index];
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Image.asset(med.iconPath, width: 24.w, height: 24.h),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    med.name,
                                    style: GoogleFonts.outfit(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF1A1C1E),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time, size: 14.sp, color: AppColors.subtitleText),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '8:00 AM', // Simplified
                                        style: GoogleFonts.outfit(
                                          fontSize: 13.sp,
                                          color: AppColors.subtitleText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: med.type.color,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                med.type.displayName,
                                style: GoogleFonts.outfit(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: med.type.textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.edit_outlined, size: 18.sp),
                                label: const Text('Edit'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFF1A1C1E),
                                  side: const BorderSide(color: Color(0xFFF1F1F1)),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.delete_outline, size: 18.sp),
                                label: const Text('Delete'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFF1A1C1E),
                                  side: const BorderSide(color: Color(0xFFF1F1F1)),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )),
        ),
        Padding(
          padding: EdgeInsets.all(20.w),
          child: GestureDetector(
            onTap: () {
              Get.bottomSheet(
                const AddMedicationModal(),
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD1D1D1), style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: AppColors.subtitleText),
                  SizedBox(width: 8.w),
                  Text(
                    'Add Medication',
                    style: GoogleFonts.outfit(
                      fontSize: 16.sp,
                      color: AppColors.subtitleText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
