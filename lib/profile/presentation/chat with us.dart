import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ChatWithUsScreen extends StatelessWidget {
  const ChatWithUsScreen({super.key});

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
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: const AssetImage('assets/icons/SupportTeam.png'),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 10.r,
                    height: 10.r,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Support Team',
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A2E35),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 6.r,
                      height: 6.r,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Online',
                      style: GoogleFonts.outfit(
                        fontSize: 12.sp,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                _buildMessage(
                  text: 'Hi! I\'m Emma from the support team. How can I help you today?',
                  time: '2:34 PM',
                  isMe: false,
                ),
                _buildMessage(
                  text: 'Hello! I\'m having trouble accessing my medication reminders.',
                  time: '2:35 PM',
                  isMe: true,
                ),
                _buildMessage(
                  text: 'I\'d be happy to help you with that! Can you tell me what specific issue you\'re experiencing with the reminders?',
                  time: '2:36 PM',
                  isMe: false,
                ),
                _buildMessage(
                  text: 'The notifications aren\'t showing up even though I have them enabled in settings.',
                  time: '2:37 PM',
                  isMe: true,
                ),
                // Typing Indicator placeholder
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15.r,
                      backgroundImage: const AssetImage('assets/images/miranda.png'),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDECE8).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: [
                          _buildDot(),
                          SizedBox(width: 4.w),
                          _buildDot(),
                          SizedBox(width: 4.w),
                          _buildDot(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Input Area
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.attach_file, color: Colors.grey[400]),
                ),
                Expanded(
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle: GoogleFonts.outfit(color: Colors.grey, fontSize: 14.sp),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Container(
                  height: 50.h,
                  width: 50.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD69785),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage({required String text, required String time, required bool isMe}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe) ...[
            CircleAvatar(
              radius: 18.r,
              backgroundImage: const AssetImage('assets/icons/SupportTeam.png'),
            ),
            SizedBox(width: 12.w),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: isMe ? const Color(0xFFD69785) : const Color(0xFFFDECE8).withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                      bottomLeft: isMe ? Radius.circular(20.r) : Radius.circular(0.r),
                      bottomRight: isMe ? Radius.circular(0.r) : Radius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    text,
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      color: isMe ? Colors.white : const Color(0xFF1A2E35),
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
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
          if (isMe) SizedBox(width: 12.w),
        ],
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 6.r,
      height: 6.r,
      decoration: const BoxDecoration(
        color: Color(0xFFD3917D),
        shape: BoxShape.circle,
      ),
    );
  }
}
