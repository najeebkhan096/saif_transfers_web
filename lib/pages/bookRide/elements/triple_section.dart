import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookRideTripInfoSection extends StatelessWidget {
  const BookRideTripInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: const Color(0xFFFF0F2F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Date & Time
          Text(
            'Sun, Apr 27, 2025 at 05:21 PM (GMT+3)',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),

          /// Departure → Arrival
          Row(
            children: [

              Expanded(
                child: Text(
                  'Airport Istanbul-Atatürk (ISL)  →  Airport Munich (MUC)',
                  style:  GoogleFonts.dmSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff64666B),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          /// Estimated arrival + Distance
          Row(
            children: [

              Expanded(
                child: Text(
                  'Estimated arrival at 12:35 PM (GMT+3)  •  1914 km',
                  style:  GoogleFonts.dmSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff64666B),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
