import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class TrendChartCard extends StatelessWidget {
  const TrendChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDECEA),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Icon(Icons.trending_up, color: const Color(0xFF925349), size: 22.sp),
                ),
              ),
              SizedBox(width: 14.w),
              Text(
                'Weekly Overview',
                style: GoogleFonts.sora(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2D3142),
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          SizedBox(
            height: 160.h,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 10,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 2,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: const Color(0xFFF1F3F4),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
                        if (value >= 0 && value < days.length) {
                          return SideTitleWidget(
                            meta: meta,
                            child: Text(
                              days[value.toInt()],
                              style: GoogleFonts.sora(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF9098A3),
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 4.2),
                      FlSpot(1, 5.5),
                      FlSpot(2, 4.8),
                      FlSpot(3, 5.2),
                      FlSpot(4, 7.8),
                      FlSpot(5, 8.5),
                      FlSpot(6, 7.2),
                    ],
                    isCurved: true,
                    curveSmoothness: 0.35,
                    color: const Color(0xFF925349),
                    barWidth: 2.5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                        radius: 4,
                        color: const Color(0xFF925349),
                        strokeWidth: 0,
                      ),
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF925349).withOpacity(0.08),
                          const Color(0xFF925349).withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
            decoration: BoxDecoration(
              color: const Color(0xFFFAF7F6),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Avg Wellness Score',
                  style: GoogleFonts.sora(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF64748B),
                  ),
                ),
                Text(
                  '7.0/10',
                  style: GoogleFonts.sora(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF925349),
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
