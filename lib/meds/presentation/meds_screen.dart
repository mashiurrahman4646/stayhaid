import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_colors.dart';
import '../controller/meds_controller.dart';
import '../widgets/all_meds_tab.dart';
import '../widgets/history_tab.dart';
import '../widgets/today_tab.dart';


class MedsScreen extends StatelessWidget {
  const MedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MedsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              'Medications',
              style: GoogleFonts.outfit(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1C1E),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Manage your treatment plan',
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                color: AppColors.subtitleText,
              ),
            ),
            SizedBox(height: 24.h),
            // Stats Cards
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  _buildStatCard(
                    title: 'Streak',
                    value: '0',
                    unit: 'days',
                    icon: 'assets/icons/Streak.png',
                    iconBg: const Color(0xFFFFECE6),
                    bgColor: const Color(0xFFF1FBF4), // Using colors from image
                  ),
                  SizedBox(width: 16.w),
                  _buildStatCard(
                    title: 'Today',
                    value: '96%',
                    unit: '',
                    icon: 'assets/icons/UpcomingMedication.png', // Assuming this is the green icon
                    iconBg: const Color(0xFFE6F7F0),
                    bgColor: const Color(0xFFF1FBF4),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            // Custom Tab Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xFFF1F1F1)),
                ),
                child: Obx(() => Row(
                      children: [
                        _buildTabItem('Today', 0, controller),
                        _buildTabItem('All Meds', 1, controller),
                        _buildTabItem('History', 2, controller),
                      ],
                    )),
              ),
            ),
            SizedBox(height: 16.h),
            // Tab Content
            Expanded(
              child: Obx(() {
                switch (controller.selectedTab.value) {
                  case 0:
                    return const TodayTab();
                  case 1:
                    return const AllMedsTab();
                  case 2:
                    return const HistoryTab();
                  default:
                    return const TodayTab();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String unit,
    required String icon,
    required Color iconBg,
    required Color bgColor,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: bgColor,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Image.asset(icon, width: 20.w, height: 20.h),
                ),
                SizedBox(width: 8.w),
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1A1C1E),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: GoogleFonts.outfit(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1C1E),
                  ),
                ),
                if (unit.isNotEmpty) ...[
                  SizedBox(width: 4.w),
                  Text(
                    unit,
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      color: AppColors.subtitleText,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, int index, MedsController controller) {
    final isSelected = controller.selectedTab.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? AppColors.primaryAction : AppColors.tabUnselected,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
