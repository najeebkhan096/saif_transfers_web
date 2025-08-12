import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/model/booking.dart';
import 'booking_tab_configs.dart';

class BookingRow extends StatelessWidget {
  final Booking booking;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const BookingRow({
    super.key,
    required this.booking,
    required this.isSelected,
    required this.onSelected,
  });

  Widget _buildCell(String text, double width, {TextStyle? style}) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: style ?? GoogleFonts.dmSans(),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      child: Row(
        children: [
          SizedBox(
            width: BookingTableConfig.checkbox,
            child: Checkbox(
              value: isSelected,
              onChanged: (value) => onSelected(value ?? false),
              activeColor: const Color(0xffcda316),
            ),
          ),
          SizedBox(
            width: BookingTableConfig.customer,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(booking.avatarUrl),
                  radius: 18,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.name,
                      style: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      booking.phone,
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildCell(booking.car, BookingTableConfig.car),
          _buildCell("${booking.date}\n${booking.time}", BookingTableConfig.dateTime),
          _buildCell(booking.start, BookingTableConfig.start),
          _buildCell(booking.end, BookingTableConfig.end),
          _buildCell(
            booking.income,
            BookingTableConfig.income,
            style: GoogleFonts.dmSans(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
