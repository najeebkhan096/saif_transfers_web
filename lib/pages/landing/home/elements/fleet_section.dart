// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

import '../../../../core/responsive.dart';

/// =================== FLEET ===================
class FleetSection extends StatelessWidget {
  const FleetSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffE8EDED),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(
        vertical: isMobile ? 30 : 60,
        horizontal: isMobile ? 20 : 40,
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 20 : 40,
        horizontal: isMobile ? 16 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Our Fleet",
                style: GoogleFonts.dmSans(
                  fontSize: isMobile ? 22 : 32,
                  fontWeight: FontWeight.bold,
                  color: appTheme.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Fleet More',
                    style: GoogleFonts.dmSans().copyWith(
                      color: appTheme.black,
                      fontSize: isMobile ? 10 : 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  CustomImageView(
                    imagePath: ImageConstants.learnMore,
                    width: 12,
                    height: 12,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 40),

          /// Fleet Cards with Wrap
          Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _buildFleetCard(
                  context,
                  title: "The BMW 7 Series Sedan",
                  subtitle:
                      'Mercedes-Benz V-Class, Chevrolet Suburban, Cadillac',
                  imagePath: ImageConstants.bmw,
                  passengers: '2 Passengers',
                  luggage: '3 Luggage',
                  isMobile: isMobile,
                  isTablet: isTablet,
                  screenWidth: screenWidth,
                ),
                _buildFleetCard(
                  context,
                  title: "Audi Q3 Sportback",
                  subtitle:
                      'Mercedes-Benz V-Class, Chevrolet Suburban, Cadillac',
                  imagePath: ImageConstants.audi,
                  passengers: '2 Passengers',
                  luggage: '2 Luggage',
                  isMobile: isMobile,
                  isTablet: isTablet,
                  screenWidth: screenWidth,
                ),
                _buildFleetCard(
                  context,
                  title: "Electric Class",
                  subtitle:
                      'Mercedes-Benz EQS, BMW 7 Series, Audi A8 or similar',
                  imagePath: ImageConstants.electricClass,
                  passengers: '2 Passengers',
                  luggage: '2 Luggage',
                  isMobile: isMobile,
                  isTablet: isTablet,
                  screenWidth: screenWidth,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFleetCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String imagePath,
    required String passengers,
    required String luggage,
    required bool isMobile,
    required bool isTablet,
    required double screenWidth,
  }) {
    double cardWidth = isMobile ? 500 : 374.w;
    // if (isMobile) {
    //   cardWidth = screenWidth * 0.9; // almost full width
    // } else if (isTablet) {
    //   cardWidth = screenWidth * 0.45; // two per row
    // } else {
    //   cardWidth = 420; // fixed width on desktop
    // }

    return Container(
      width: cardWidth,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          /// Vehicle Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w600,
                fontSize: isMobile ? 20 : 20.sp,
                color: appTheme.black,
              ),
            ),
          ),
          const SizedBox(height: 10),

          /// Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              subtitle,
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w500,
                fontSize: isMobile ? 14 : 14.sp,
                color: appTheme.black,
              ),
            ),
          ),
          const SizedBox(height: 20),

          /// Vehicle Image
          Center(
            child: CustomImageView(
              imagePath: imagePath,
              width: isMobile ? 312 : 312.w,
              height: isMobile ? 144 : 144.w,
            ),
          ),
          const SizedBox(height: 20),

          /// Passengers & Luggage
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoItem(ImageConstants.passenger, passengers, isMobile),
                _buildInfoItem(ImageConstants.luggage, luggage, isMobile),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// Passenger / Luggage Item
  Widget _buildInfoItem(String iconPath, String text, isMobile) {
    return Row(
      children: [
        CustomImageView(imagePath: iconPath, width: 16.w, height: 16.w),
        const SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.dmSans(
            fontSize: isMobile ? 12 : 12.sp,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
