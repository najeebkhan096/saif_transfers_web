// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

import '../../../../core/responsive.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 30.h : 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "How It Works",
            style: TextStyle(
              fontSize: isMobile ? 22 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 30.w, // space between items horizontally
              runSpacing: 30.h, // space between rows
              children: [
                _buildStep(
                  context,
                  iconPath: ImageConstants.route,
                  title: "Create Your Route",
                  desc:
                      "Enter your pickup & dropoff locations or the number of hours you wish to book a car and driver for.",
                  mobile: isMobile,
                  tablet: isTablet,
                ),
                _buildArrow(isMobile),
                _buildStep(
                  context,
                  iconPath: ImageConstants.vehicle,
                  title: "Meet Your Driver",
                  desc:
                      "You can easily make a reservation through our website, mobile app, or by contacting our customer service team.",
                  mobile: isMobile,
                  tablet: isTablet,
                ),
                _buildArrow(isMobile),
                _buildStep(
                  context,
                  iconPath: ImageConstants.like,
                  title: "Receive a Confirmation",
                  desc:
                      "Once your booking is received, you'll get a confirmation email or notification with all the details of your reservation.",
                  mobile: isMobile,
                  tablet: isTablet,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Arrow Widget (hidden on mobile for cleaner layout)
  Widget _buildArrow(bool mobile) {
    if (mobile) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomImageView(
        imagePath: ImageConstants.arrowButton,
        width: 72.w,
        height: 72.w,
      ),
    );
  }

  /// Step Card Widget
  Widget _buildStep(
    BuildContext context, {
    required String iconPath,
    required String title,
    required String desc,
    required bool mobile,
    required bool tablet,
  }) {
    double cardWidth = 283;

    return SizedBox(
      width: cardWidth,
      child: Column(
        crossAxisAlignment: mobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CustomImageView(
              imagePath: iconPath,
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.bold,
              fontSize: mobile ? 16 : 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: GoogleFonts.dmSans(
              fontSize: mobile ? 13 : 14,
              height: 1.5,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
