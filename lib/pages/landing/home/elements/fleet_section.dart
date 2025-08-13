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
        color: appTheme.coloF6F6F6,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(
        vertical: mobile ? 30 : 60,
        horizontal: mobile ? 16 : 40,
      ),
      padding: EdgeInsets.symmetric(
        vertical: mobile ? 12 : 16,
        horizontal: mobile ? 12 : 16,
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
          const SizedBox(height: 10),

          /// Subtitle
          Text(
            "Choose from our range of premium vehicles to suit your needs.",
            style: GoogleFonts.dmSans(
              fontSize: mobile ? 14 : 16,
              color: Colors.black54,
              height: 1.4,
            ),
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
    double cardWidth = mobile ? double.infinity : (tablet ? 240 : 300);

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Vehicle Title
          Text(
            title,
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: appTheme.black,
            ),
          ),
          const SizedBox(height: 5),

          /// Subtitle
          Text(
            subtitle,
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: appTheme.black,
            ),
          ),
          const SizedBox(height: 12),

          /// Vehicle Image
          Center(
            child: CustomImageView(
              imagePath: imagePath,
              fit: BoxFit.cover,
              width: 200,
            ),
          ),
          const SizedBox(height: 12),

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
          style: GoogleFonts.dmSans(
            fontSize: 10,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
