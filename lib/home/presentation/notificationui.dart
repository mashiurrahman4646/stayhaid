import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Container(
            padding: EdgeInsets.all(8.r),
            decoration: const BoxDecoration(
              color: Color(0xFFFDECE8),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Color(0xFFD3917D)),
          ),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.outfit(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A2E35),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mark all as read',
              style: GoogleFonts.outfit(
                fontSize: 12.sp,
                color: const Color(0xFFD3917D),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        children: [
          _buildSectionTitle('Today'),
          _buildNotificationItem(
            icon: Icons.calendar_today_outlined,
            title: 'Cycle Update',
            message: 'Your period is expected to start in 2 days. Stay prepared!',
            time: '2 mins ago',
            isRead: false,
          ),
          _buildNotificationItem(
            icon: Icons.medication_outlined,
            title: 'Medication Reminder',
            message: 'It\'s time for your afternoon Estradiol dose.',
            time: '1 hour ago',
            isRead: false,
          ),
          SizedBox(height: 20.h),
          _buildSectionTitle('Yesterday'),
          _buildNotificationItem(
            icon: Icons.auto_awesome_outlined,
            title: 'Daily Insight',
            message: 'New insight available: "Managing hot flashes naturally".',
            time: 'Yesterday, 10:00 AM',
            isRead: true,
          ),
          _buildNotificationItem(
            icon: Icons.favorite_border,
            title: 'Health Tip',
            message: 'Don\'t forget to stay hydrated! Drink at least 8 glasses of water today.',
            time: 'Yesterday, 8:30 AM',
            isRead: true,
          ),
          _buildNotificationItem(
            icon: Icons.shield_outlined,
            title: 'Security Alert',
            message: 'Your account was logged in from a new device.',
            time: '2 days ago',
            isRead: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h, top: 10.h),
      child: Text(
        title,
        style: GoogleFonts.outfit(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1A2E35),
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String message,
    required String time,
    required bool isRead,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isRead ? Colors.white : const Color(0xFFFDECE8).withOpacity(0.15),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isRead ? Colors.grey.withOpacity(0.1) : const Color(0xFFD3917D).withOpacity(0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: isRead ? const Color(0xFFF5F5F5) : const Color(0xFFFDECE8),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isRead ? Colors.grey : const Color(0xFFD3917D),
              size: 20.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.outfit(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A2E35),
                      ),
                    ),
                    if (!isRead)
                      Container(
                        width: 8.r,
                        height: 8.r,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD3917D),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  message,
                  style: GoogleFonts.outfit(
                    fontSize: 13.sp,
                    color: const Color(0xFF5A6F65),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  time,
                  style: GoogleFonts.outfit(
                    fontSize: 11.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
