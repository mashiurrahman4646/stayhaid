import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controller/track_controller.dart';
import '../widgets/track_mood_selector.dart';
import '../widgets/track_number_selector.dart';
import '../widgets/track_slider_selector.dart';
import '../widgets/trend_chart_card.dart';
import '../widgets/trend_pattern_row.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TrackController controller = Get.put(TrackController());

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h),
                      Text(
                        'Symptom Tracker',
                        style: GoogleFonts.sora(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2D3142),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Sunday, March 22',
                        style: GoogleFonts.sora(
                          fontSize: 16.sp,
                          color: const Color(0xFF9098A3),
                        ),
                      ),
                      SizedBox(height: 28.h),

                      // Tabs
                      Container(
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: const Color(0xFFE5E7EB), width: 0.5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(6.w),
                          child: Row(
                            children: [
                              _buildTabItem(0, 'Log Today', controller),
                              _buildTabItem(1, 'Trends', controller),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),

                      Obx(() => controller.activeTab.value == 0 
                          ? _buildLogTodayView(controller) 
                          : _buildTrendsView()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, String label, TrackController controller) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Obx(() {
          bool isSelected = controller.activeTab.value == index;
          return Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.sora(
                  fontSize: 14.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? const Color(0xFF925349) : const Color(0xFF64748B),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildLogTodayView(TrackController controller) {
    return Column(
      children: [
        TrackNumberSelector(
          title: 'Hot Flashes',
          subtitle: 'Number of episodes today',
          iconPath: 'assets/icons/hoteflash.png',
          iconBg: const Color(0xFFFFF0EB),
          currentVal: controller.selectedHotFlash.value,
          onSelect: controller.updateHotFlash,
        ),
        SizedBox(height: 24.h),

        TrackNumberSelector(
          title: 'Night Sweats',
          subtitle: 'Number of episodes today',
          iconPath: 'assets/icons/NightSweats.png',
          iconBg: const Color(0xFFFDECEA),
          currentVal: controller.selectedNightSweat.value,
          onSelect: controller.updateNightSweat,
        ),
        SizedBox(height: 24.h),

        TrackSliderSelector(
          title: 'Sleep Quality',
          subtitle: 'How did you rest last night?',
          iconPath: 'assets/icons/SleepQuality.png',
          iconBg: const Color(0xFFE8F5E9),
          currentVal: controller.sleepQuality.value,
          onSelect: controller.updateSleepQuality,
        ),
        SizedBox(height: 24.h),

        TrackMoodSelector(
          selectedMood: controller.selectedMood.value,
          onSelect: controller.updateMood,
        ),
        SizedBox(height: 24.h),

        TrackSliderSelector(
          title: 'Brain Fog',
          subtitle: 'How clear was your mind?',
          iconPath: 'assets/icons/brain.png',
          iconBg: const Color(0xFFF1F8E9),
          currentVal: controller.brainFog.value,
          onSelect: controller.updateBrainFog,
        ),
        SizedBox(height: 24.h),

        TrackSliderSelector(
          title: 'Energy Level',
          subtitle: 'How was your energy today?',
          iconPath: 'assets/icons/energys.png',
          iconBg: const Color(0xFFEDE7F6),
          currentVal: controller.energyLevel.value,
          onSelect: controller.updateEnergyLevel,
        ),
        SizedBox(height: 40.h),

        // Save Button
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              gradient: const LinearGradient(
                colors: [Color(0xFFAC6B5B), Color(0xFFE3A593)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFAC6B5B).withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Save Today's Log",
                style: GoogleFonts.sora(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }

  Widget _buildTrendsView() {
    return Column(
      children: [
        const TrendChartCard(),
        SizedBox(height: 24.h),

        // This Week's Patterns Card
        Container(
          padding: EdgeInsets.all(24.w),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This Week\'s Patterns',
                style: GoogleFonts.sora(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2D3142),
                ),
              ),
              SizedBox(height: 24.h),
              const TrendPatternRow(
                title: 'Hot Flashes',
                subtitle: '12 total',
                gradientColors: [Color(0xFFFDADA0), Color(0xFFF97386)],
                percentage: 0.7,
              ),
              SizedBox(height: 24.h),
              const TrendPatternRow(
                title: 'Sleep Quality',
                subtitle: '6.8/10 avg',
                gradientColors: [Color(0xFFFED7AA), Color(0xFFEAB308)],
                percentage: 0.6,
              ),
              SizedBox(height: 24.h),
              const TrendPatternRow(
                title: 'Energy Level',
                subtitle: '7.2/10 avg',
                gradientColors: [Color(0xFFFBCFE8), Color(0xFF84473E)],
                percentage: 0.75,
              ),
            ],
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
