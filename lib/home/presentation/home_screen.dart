import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widgets/daily_insight_card.dart';
import '../widgets/home_header.dart';
import '../widgets/home_info_tile.dart';
import '../widgets/quick_log_section.dart';
import '../widgets/today_summary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                
                // ===== Header =====
                Obx(() => HomeHeader(userName: controller.userName.value)),
                SizedBox(height: 24.h),

                // ===== Today's Summary Card =====
                Obx(() => TodaySummaryCard(
                  score: controller.wellnessScore.value,
                  status: controller.wellnessStatus.value,
                )),
                SizedBox(height: 28.h),

                // ===== Quick Log Section =====
                const QuickLogSection(),
                SizedBox(height: 28.h),

                // ===== Upcoming Medication =====
                const HomeInfoTile(
                  iconPath: 'assets/icons/Medication.png',
                  title: 'Upcoming Medication',
                  subtitle: 'Estradiol - 2:00 PM',
                ),
                SizedBox(height: 10.h),

                // ===== Prepare for Doctor Visit =====
                const HomeInfoTile(
                  iconPath: 'assets/icons/PrepareforDoctoreVisit.png',
                  title: 'Prepare for Doctore Visit',
                  subtitle: 'Review your health summary',
                ),
                SizedBox(height: 12.h),

                // ===== Diet Tracker =====
                const HomeInfoTile(
                  iconPath: 'assets/icons/DietTracker.png',
                  title: 'Diet Tracker',
                ),
                SizedBox(height: 12.h),

                // ===== Daily Insight =====
                const DailyInsightCard(),
                SizedBox(height: 20.h),

                // ===== Join Community Button =====
                _buildJoinCommunityButton(),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJoinCommunityButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF925349),
                Color(0xFFFDADA0),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF925349).withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Text(
            'Join Community',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
