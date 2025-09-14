// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

/// Single Overview Card widget
class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final String imagePath;

  const OverviewCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageView(imagePath: imagePath, width: 30, height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: GoogleFonts.dmSans(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 1,
              ),
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstants.farwardIcon,
            color: appTheme.black,
          ),
        ],
      ),
    );
  }
}
