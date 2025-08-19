// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
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
    final bool mobile = Responsive.isMobile(context);
    final bool tablet = Responsive.isTablet(context);

    return Container(
      decoration: BoxDecoration(
        color: Color(0xffE8EDED),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(
        vertical: mobile ? 30 : 60,
        horizontal: mobile ? 16 : 40,
      ),
      padding: EdgeInsets.symmetric(
        vertical: mobile ? 12 : 40,
        horizontal: mobile ? 12 : 40,
      ),
      // height: mobile ? 1320 : 560,
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
                  fontSize: mobile ? 22 : 32,
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
                      fontSize: mobile ? 10 : 12,
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

          /// Fleet Cards
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildFleetCard(
                title: "The BMW 7 Series Sedan",
                subtitle: 'Mercedes-Benz V-Class, Chevrolet Suburban, Cadillac',
                imagePath: ImageConstants.bmw,
                passengers: '2 Passengers',
                luggage: '3 Luggage',
                mobile: mobile,
                tablet: tablet,
              ),
              _buildFleetCard(
                title: "Audi Q3 Sportback",
                subtitle: 'Mercedes-Benz V-Class, Chevrolet Suburban, Cadillac',
                imagePath: ImageConstants.audi,
                passengers: '2 Passengers',
                luggage: '2 Luggage',
                mobile: mobile,
                tablet: tablet,
              ),
              _buildFleetCard(
                title: "Electric Class",
                subtitle: 'Mercedes-Benz EQS, BMW 7 Series, Audi A8 or similar',
                imagePath: ImageConstants.electricClass,
                passengers: '2 Passengers',
                luggage: '2 Luggage',
                mobile: mobile,
                tablet: tablet,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFleetCard({
    required String title,
    required String subtitle,
    required String imagePath,
    required String passengers,
    required String luggage,
    required bool mobile,
    required bool tablet,
  }) {
    double cardWidth = 440;
    return Container(
      width: cardWidth,
      height: 372,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Vehicle Title
          Text(
            title,
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: appTheme.black,
            ),
          ),
          const SizedBox(height: 10),

          /// Subtitle
          Text(
            subtitle,
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: appTheme.black,
            ),
          ),
          const SizedBox(height: 20),

          /// Vehicle Image
          Center(
            child: CustomImageView(
              imagePath: imagePath,
              fit: BoxFit.cover,
              height: 144,
            ),
          ),
          const SizedBox(height: 20),

          /// Passengers & Luggage Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoItem(ImageConstants.passenger, passengers),
              _buildInfoItem(ImageConstants.luggage, luggage),
            ],
          ),
        ],
      ),
    );
  }

  /// Helper widget for passenger/luggage info
  Widget _buildInfoItem(String iconPath, String text) {
    return Row(
      children: [
        CustomImageView(imagePath: iconPath, width: 16, height: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.dmSans(fontSize: 10, color: Colors.black54),
        ),
      ],
    );
  }
}
