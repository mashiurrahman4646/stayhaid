import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_colors.dart';

class MirandaScreen extends StatelessWidget {
  const MirandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 70.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: CircleAvatar(
            radius: 25.r,
            backgroundImage: const AssetImage('assets/images/miranda.png'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Miranda',
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF904D38), // More accurate brown tone
              ),
            ),
            Text(
              'AI Menopause Companion',
              style: GoogleFonts.outfit(
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.grey),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Miranda Message
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18.r,
                        backgroundImage: const AssetImage('assets/images/Avatar.png'),
                      ),
                      SizedBox(width: 12.w),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Text(
                            "Hi! I'm Miranda, your menopause companion. I'm here to answer questions, help you track symptoms, and prepare for doctor visits. What would you like to talk about today?",
                            style: GoogleFonts.outfit(
                              fontSize: 14.sp,
                              color: const Color(0xFF4A4A4A),
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 180.h), // Increased space as per Figma
                  
                  Text(
                    'Suggested questions:',
                    style: GoogleFonts.outfit(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF6B7270), // Subtitle color from AppColors
                    ),
                  ),
                  
                  SizedBox(height: 16.h),
                  
                  // Suggested Questions Grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 1.35, // Adjusted for better card height
                    children: [
                      _buildSuggestedQuestion('What can I do about hot flashes?'),
                      _buildSuggestedQuestion('Help me prep for my doctor visit'),
                      _buildSuggestedQuestion('How to improve my sleep?'),
                      _buildSuggestedQuestion('Tell me about HRT options'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Chat Input Area
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
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
                        hintText: 'Ask Miranda anything...',
                        hintStyle: GoogleFonts.outfit(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
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
                    color: Color(0xFFD3917D),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedQuestion(String question) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          question,
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF4A4A4A),
          ),
        ),
      ),
    );
  }
}
