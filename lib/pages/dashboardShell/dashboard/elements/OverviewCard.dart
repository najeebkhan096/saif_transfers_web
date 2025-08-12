
// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Single Overview Card widget
class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const OverviewCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.dmSans(
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              letterSpacing: 1,
            ),
          ),

        ],
      ),
    );
  }
}
