import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientSliderTrackShape extends RoundedRectSliderTrackShape {
  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Paint activePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFDADA0), Color(0xFF925349)],
      ).createShader(trackRect)
      ..style = PaintingStyle.fill;

    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor!
      ..style = PaintingStyle.fill;

    final Radius trackRadius = Radius.circular(trackRect.height / 2);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        trackRect.top,
        thumbCenter.dx,
        trackRect.bottom,
        topLeft: trackRadius,
        bottomLeft: trackRadius,
      ),
      activePaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        trackRect.top,
        trackRect.right,
        trackRect.bottom,
        topRight: trackRadius,
        bottomRight: trackRadius,
      ),
      inactivePaint,
    );
  }
}

class TrackSliderSelector extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final Color iconBg;
  final double currentVal;
  final Function(double) onSelect;

  const TrackSliderSelector({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.iconBg,
    required this.currentVal,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
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
        children: [
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
                child: Center(
                  child: Image.asset(iconPath, width: 24.w, height: 24.h),
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.sora(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2D3142),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.sora(
                        fontSize: 13.sp,
                        color: const Color(0xFF9098A3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: 285.w,
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 12.h,
                activeTrackColor: const Color(0xFFAC6B5B).withOpacity(0.6),
                inactiveTrackColor: const Color(0xFFF3F4F6),
                thumbColor: Colors.white,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.r, elevation: 4),
                overlayColor: const Color(0xFFAC6B5B).withOpacity(0.1),
                trackShape: GradientSliderTrackShape(),
              ),
              child: Slider(
                value: currentVal,
                min: 0,
                max: 10,
                onChanged: onSelect,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'POOR',
                  style: GoogleFonts.sora(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF9098A3),
                  ),
                ),
                Text(
                  '${currentVal.toInt()}/10',
                  style: GoogleFonts.sora(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFAC6B5B),
                  ),
                ),
                Text(
                  'EXCELLENT',
                  style: GoogleFonts.sora(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF9098A3),
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
