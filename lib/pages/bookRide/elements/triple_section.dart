import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BookRideTripInfoSection extends StatelessWidget {
  const BookRideTripInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      padding: EdgeInsets.all(
        isMobile ? 12 : 12.w,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFF0F2F7),
        borderRadius: BorderRadius.circular(
          isMobile ? 10 : 10.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Date & Time
          Text(
            'Sun, Apr 27, 2025 at 05:21 PM (GMT+3)',
            style: TextStyle(
              fontSize: isMobile ? 15 : 15.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: isMobile ? 8 : 8.h),

          /// Departure → Arrival
          Row(
            children: [
              Expanded(
                child: Text(
                  'Airport Istanbul-Atatürk (ISL)  →  Airport Munich (MUC)',
                  style: GoogleFonts.dmSans(
                    fontSize: isMobile ? 13 : 13.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff64666B),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 6 : 6.h),

          /// Estimated arrival + Distance
          Row(
            children: [
              Expanded(
                child: Text(
                  'Estimated arrival at 12:35 PM (GMT+3)  •  1914 km',
                  style: GoogleFonts.dmSans(
                    fontSize: isMobile ? 13 : 13.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff64666B),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
