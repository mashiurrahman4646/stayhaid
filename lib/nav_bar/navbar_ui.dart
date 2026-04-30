import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar_controller.dart';

class NavbarUi extends StatelessWidget {
  const NavbarUi({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController controller = Get.put(NavbarController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: const Color(0xFFFBE4D2).withOpacity(0.5), width: 1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, 'HOME', null, 'assets/icons/home.png', controller),
              _buildNavItem(1, 'TRACK', null, 'assets/icons/track.png', controller),
              _buildNavItem(2, 'MIRANDA', null, 'assets/icons/miranda.png', controller),
              _buildNavItem(3, 'MEDS', null, 'assets/icons/Meds.png', controller),
              _buildNavItem(4, 'PROFILE', null, 'assets/icons/profilee.png', controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, IconData? icon, String? assetPath, NavbarController controller) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;
      Color activeColor = const Color(0xFFAC6B5B);
      Color inactiveColor = const Color(0xFF5A6F65); // More muted inactive color from design

      return GestureDetector(
        onTap: () => controller.changeIndex(index),
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          width: 70.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (assetPath != null)
                Image.asset(
                  assetPath,
                  width: label == 'HOME' 
                      ? 26.r 
                      : (label == 'PROFILE' ? 21.r : 24.r),
                  height: label == 'HOME' 
                      ? 26.r 
                      : (label == 'PROFILE' ? 21.r : 24.r),
                  color: isSelected ? activeColor : inactiveColor,
                  fit: BoxFit.contain,
                )
              else if (icon != null)
                Icon(
                  icon,
                  size: 24.r,
                  color: isSelected ? activeColor : inactiveColor,
                ),
              SizedBox(height: 6.h),
              Text(
                label.toUpperCase(), // All Caps as per screenshot
                style: GoogleFonts.outfit(
                  fontSize: 10.sp,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? activeColor : inactiveColor,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
