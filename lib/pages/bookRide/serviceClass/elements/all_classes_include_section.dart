import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';

class AllClassesIncludeSection extends StatelessWidget {
  const AllClassesIncludeSection({super.key});

  static const List<String> features = [
    "Free cancellation up until 1 hour before pickup",
    "Free 60 minutes of wait time",
    "Meet & Greet",
    "Complimentary bottle of water",
  ];
  static const List<String> notes = [
    "Guest/luggage capacities must be abided by for safety reasons. If you are unsure, select a larger class as chauffeurs may turn down service when they are exceeded.",
    "The vehicle images above are examples. You may get a different vehicle o similar quality.",
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 720;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide = constraints.maxWidth >= (isMobile ? 720 : 720.w);
        final double gap = isMobile ? 16 : 16.w;

        return Container(
          padding: EdgeInsets.fromLTRB(
            isMobile ? 16 : 16.w,
            isMobile ? 16 : 16.h,
            isMobile ? 16 : 16.w,
            isMobile ? 14 : 14.h,
          ),
          decoration: BoxDecoration(
            color: appTheme.whiteCustom,
            borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
            border: Border.all(
              color: const Color(0xFFE5E7EB),
              width: isMobile ? 1 : 1.w,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All classes include:",
                style: TextStyle(
                  fontSize: isMobile ? 14 : 14.sp,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF111827),
                ),
              ),
              SizedBox(height: isMobile ? 12 : 12.h),

              /// Features
              Wrap(
                spacing: gap,
                runSpacing: isMobile ? 12 : 12.h,
                children: features.map((t) {
                  final double w = isWide
                      ? (constraints.maxWidth - gap) / 2
                      : constraints.maxWidth;
                  return SizedBox(
                    width: w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Ring bullet
                        Container(
                          margin: EdgeInsets.only(top: isMobile ? 2.5 : 2.5.h),
                          width: isMobile ? 16 : 16.w,
                          height: isMobile ? 16 : 16.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff64666B),
                          ),
                          child: Icon(
                            Icons.check,
                            size: isMobile ? 10 : 10.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: isMobile ? 10 : 10.w),
                        Expanded(
                          child: Text(
                            t,
                            style: TextStyle(
                              fontSize: isMobile ? 13 : 13.sp,
                              height: 1.35,
                              color: const Color(0xFF4B5563),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: isMobile ? 20 : 20.h),

              Text(
                "Please note:",
                style: TextStyle(
                  fontSize: isMobile ? 14 : 14.sp,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF111827),
                ),
              ),
              SizedBox(height: isMobile ? 12 : 12.h),

              /// Notes
              Wrap(
                spacing: gap,
                runSpacing: isMobile ? 12 : 12.h,
                children: notes.map((t) {
                  final double w = isWide
                      ? (constraints.maxWidth - gap) / 2
                      : constraints.maxWidth;
                  return SizedBox(
                    width: w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info,
                          size: isMobile ? 20 : 20.sp,
                          color: const Color(0xff64666B),
                        ),
                        SizedBox(width: isMobile ? 10 : 10.w),
                        Expanded(
                          child: Text(
                            t,
                            style: TextStyle(
                              fontSize: isMobile ? 13 : 13.sp,
                              height: 1.35,
                              color: const Color(0xFF4B5563),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
