import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/app_colors.dart';

class AddMedicationModal extends StatelessWidget {
  const AddMedicationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Medication',
                      style: GoogleFonts.outfit(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A1C1E),
                      ),
                    ),
                    Text(
                      'Update medication details',
                      style: GoogleFonts.outfit(
                        fontSize: 14.sp,
                        color: AppColors.subtitleText,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            _buildLabel('Medication Name *'),
            _buildTextField(hint: 'Estradiol'),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Dosage *'),
                      _buildTextField(hint: '2mg'),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Type'),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: 'Estrogen',
                            isExpanded: true,
                            items: ['Estrogen', 'Hormone', 'Supplement']
                                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (val) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            _buildLabel('Color'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildColorOption(const Color(0xFFD69785), isSelected: true),
                _buildColorOption(const Color(0xFFFCA5A5)),
                _buildColorOption(const Color(0xFFFBBF24)),
                _buildColorOption(const Color(0xFFFCA5A5).withOpacity(0.5)),
                _buildColorOption(const Color(0xFFA5B4FC)),
                _buildColorOption(const Color(0xFF5A6F65)),
              ],
            ),
            SizedBox(height: 24.h),
            _buildLabel('Dosing Times *'),
            _buildDosingTimeTile('08:00 AM'),
            SizedBox(height: 12.h),
            _buildDosingTimeTile('08:00 PM'),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD1D1D1), style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: AppColors.subtitleText, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Add Time',
                    style: GoogleFonts.outfit(
                      fontSize: 16.sp,
                      color: AppColors.subtitleText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            _buildButton(
              'Update Medication',
              onPressed: () => Get.back(),
              isPrimary: true,
            ),
            SizedBox(height: 12.h),
            _buildButton(
              'Cancel',
              onPressed: () => Get.back(),
              isPrimary: false,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: GoogleFonts.outfit(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1A1C1E),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: GoogleFonts.outfit(color: AppColors.subtitleText),
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color, {bool isSelected = false}) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: const Color(0xFFD69785), width: 2) : null,
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildDosingTimeTile(String time) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFF1F1F1)),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(Icons.access_time, size: 20.sp, color: const Color(0xFFD3917D)),
          SizedBox(width: 12.w),
          Text(
            time,
            style: GoogleFonts.outfit(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1C1E),
            ),
          ),
          const Spacer(),
          Icon(Icons.close, size: 20.sp, color: AppColors.subtitleText),
        ],
      ),
    );
  }

  Widget _buildButton(String text, {required VoidCallback onPressed, required bool isPrimary}) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        gradient: isPrimary
            ? const LinearGradient(colors: [Color(0xFFD69785), Color(0xFFE2A492)])
            : null,
        border: isPrimary ? null : Border.all(color: const Color(0xFFF1F1F1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30.r),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: isPrimary ? Colors.white : const Color(0xFF1A1C1E),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
