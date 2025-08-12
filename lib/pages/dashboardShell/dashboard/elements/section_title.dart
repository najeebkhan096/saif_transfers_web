import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Section Title widget with consistent styling
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      ),
    );
  }
}
