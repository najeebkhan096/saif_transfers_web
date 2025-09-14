import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';

import '../../../model/service_class_info.dart';
import '../../../widgets/custom_image_view.dart';

class ServicesListSection extends StatefulWidget {
  final List<ServiceClassInfo> services;

  const ServicesListSection({
    super.key,
    required this.services,
  });

  @override
  State<ServicesListSection> createState() => _ServicesListSectionState();
}

class _ServicesListSectionState extends State<ServicesListSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    // Font sizes
    final double titleSize = isMobile ? 14 : 16.sp;
    final double priceSize = isMobile ? 14 : 18.sp;
    final double descSize = isMobile ? 12 : 13.sp;
    final double iconSize = isMobile ? 14 : 16.w;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Top Info
        Padding(
          padding: EdgeInsets.only(
            left: isMobile ? 6 : 4.w,
            bottom: isMobile ? 8 : 12.h,
          ),
          child: Text(
            'All prices include VAT, fees, and tolls',
            style: TextStyle(
              fontSize: isMobile ? 12 : 13.sp,
              color: Colors.black54,
            ),
          ),
        ),

        /// Services List
        Column(
          children: List.generate(widget.services.length, (index) {
            final service = widget.services[index];
            final selected = index == selectedIndex;

            return GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Container(
                margin: EdgeInsets.only(bottom: isMobile ? 12 : 12.h),
                decoration: BoxDecoration(
                  color: selected ? const Color(0xFFF2F4F6) : Colors.white,
                  borderRadius: BorderRadius.circular(isMobile ? 8 : 8.r),
                  border: Border.all(
                    color: selected ? Colors.black87 : Colors.grey.shade300,
                    width: selected ? (isMobile ? 2 : 2.w) : (isMobile ? 1 : 1.w),
                  ),
                  boxShadow: selected
                      ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: isMobile ? 6 : 6.r,
                      offset: Offset(0, isMobile ? 2 : 2.h),
                    ),
                  ]
                      : null,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 10 : 14.w,
                    vertical: isMobile ? 10 : 14.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Car Image
                      CustomImageView(imagePath: service.imageUrl),

                      SizedBox(width: isMobile ? 10 : 16.w),

                      /// Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.title,
                              style: GoogleFonts.dmSans(
                                fontSize: titleSize,
                                fontWeight: FontWeight.w400,
                                color: appTheme.black,
                              ),
                            ),
                            SizedBox(height: isMobile ? 8 : 8.h),

                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: iconSize,
                                  color: Colors.black54,
                                ),
                                SizedBox(width: isMobile ? 6 : 6.w),
                                Text(
                                  service.capacity.toString(),
                                  style: TextStyle(
                                    fontSize: descSize,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(width: isMobile ? 12 : 12.w),
                                Icon(
                                  Icons.card_travel,
                                  size: iconSize,
                                  color: Colors.black54,
                                ),
                                SizedBox(width: isMobile ? 6 : 6.w),
                                Text(
                                  service.luggage.toString(),
                                  style: TextStyle(
                                    fontSize: descSize,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: isMobile ? 10 : 10.h),

                            Text(
                              service.description,
                              style: GoogleFonts.dmSans(
                                fontSize: isMobile ? 13 : 13.sp,
                                fontWeight: FontWeight.w400,
                                color: appTheme.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Price + Chevron
                      SizedBox(width: isMobile ? 8 : 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${service.price.toStringAsFixed(2)} €',
                            style: TextStyle(
                              fontSize: priceSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: isMobile ? 8 : 12.h),
                          Icon(
                            selected ? Icons.expand_less : Icons.expand_more,
                            size: isMobile ? 20 : 22.w,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
