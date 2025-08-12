// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/model/driver.dart';

/// Driver List item widget
class DriverListItem extends StatelessWidget {
  final DriverModel driver;

  const DriverListItem({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(driver.avatar),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  driver.firstName,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  driver.phone!,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Orders: ${driver.orders}',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Income: \$${driver.income?.toStringAsFixed(0)}',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
