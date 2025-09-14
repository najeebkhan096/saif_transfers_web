import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/core/responsive.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Our Services",
          style: TextStyle(
            fontSize: isMobile ? 24 : 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 30, // horizontal space between items
              runSpacing: 30, // vertical space between rows
              children: [
                _buildServiceCard(
                  context,
                  title: "Airport Transfer",
                  subtitle:
                  "Once you've arrived at your destination, hotel transfer services ensure a smooth.",
                  imagePath: ImageConstants.airportTransfers,
                  mobile: isMobile,
                  tablet: isTablet,
                ),
                _buildServiceCard(
                  context,
                  title: "Luxury Class",
                  subtitle:
                  "At the heart of Wedding Class is a commitment to personalized service.",
                  imagePath: ImageConstants.luxuryClass,
                  mobile: isMobile,
                  tablet: isTablet,
                ),
                _buildServiceCard(
                  context,
                  title: "Sprinter Class",
                  subtitle:
                  "In today's connected world, staying connected while on the move is essential.",
                  imagePath: ImageConstants.sprinter,
                  mobile: isMobile,
                  tablet: isTablet,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required String imagePath,
        required bool mobile,
        required bool tablet,
      }) {
    return SizedBox(
      width: 400.w,
      // margin: EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 350.w,
            width: double.infinity,
            fit: BoxFit.fill,
            radius: BorderRadius.circular(10),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.dmSans().copyWith(
              color: appTheme.black,
              fontSize: mobile ? 16 : 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: GoogleFonts.dmSans().copyWith(
              color: appTheme.color626262,
              fontSize: mobile ? 10 : 12,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Learn More',
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
    );
  }
}
