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
        height: 100.h,
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
              _buildNavItem(0, 'HOME', null, 'assets/icons/homes.png', controller),
              _buildNavItem(1, 'TRACK', null, 'assets/icons/tracks.png', controller),
              _buildNavItem(2, 'MIRANDA', null, 'assets/icons/Miranda.png', controller),
              _buildNavItem(3, 'MEDS', null, 'assets/icons/meds.png', controller),
              _buildNavItem(4, 'PROFILE', null, 'assets/icons/profile.png', controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, IconData? icon, String? assetPath, NavbarController controller) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;
      Color activeColor = const Color(0xFFAC6B5B); // Maroon/Brown from buttons
      Color inactiveColor = Colors.black;

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
                  width: 26.w,
                  height: 26.h,
                  color: isSelected ? activeColor : inactiveColor,
                )
              else if (icon != null)
                Icon(
                  icon,
                  size: 26.sp,
                  color: isSelected ? activeColor : inactiveColor,
                ),
              SizedBox(height: 6.h),
              Text(
                label,
                style: GoogleFonts.sora(
                  fontSize: 10.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? activeColor : inactiveColor,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
