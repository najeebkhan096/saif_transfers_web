import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

/// Section Title widget with consistent styling
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.dmSans(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CustomImageView(imagePath: ImageConstants.farwardIcon),
        ),
      ],
    );
  }
}
