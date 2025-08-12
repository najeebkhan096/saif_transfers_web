import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theme/theme_helper.dart';
import 'booking_tab_configs.dart';

class BookingsTableHeader extends StatelessWidget {
  const BookingsTableHeader({super.key});

  Widget _buildHeaderCell(String text, double width) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: appTheme.colorF7F8FA,
        border: Border.all(color: appTheme.colorEFF0F4),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            SizedBox(width: BookingTableConfig.checkbox), // Checkbox placeholder
            _buildHeaderCell("User", BookingTableConfig.customer),
            _buildHeaderCell("Car", BookingTableConfig.car),
            _buildHeaderCell("Date & Time", BookingTableConfig.dateTime),
            _buildHeaderCell("Start Location", BookingTableConfig.start),
            _buildHeaderCell("End Location", BookingTableConfig.end),
            _buildHeaderCell("Income", BookingTableConfig.income),
          ],
        ),
      ),
    );
  }
}
