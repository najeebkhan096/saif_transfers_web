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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC), // light grey background
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Left: Avatar + Info
          Row(
            children: [
              // With this:
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: driver.avatar.isNotEmpty
                    ? Image.network(
                  driver.avatar,
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  'assets/images/default_avatar.png',
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    driver.firstName,
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: const Color(0xFF2E3A59), // dark text
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    driver.phone ?? 'No phone',
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Right: Orders + Income
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Orders: ',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                  children: [
                    TextSpan(
                      text: '${driver.orders}',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: const Color(0xFF2E3A59), // dark blue text
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(
                  text: 'Income: ',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                  children: [
                    TextSpan(
                      text: '\$${driver.income?.toStringAsFixed(0) ?? "0"}',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: const Color(0xFF1B2B6B), // navy blue
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
