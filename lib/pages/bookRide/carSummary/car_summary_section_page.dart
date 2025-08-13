import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';

class CarSummarySection extends StatelessWidget {
  const CarSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),
            Text(
              "Ride Details",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 10),
            /// Car Details Card
            Container(
              width: 600,
              padding: EdgeInsets.all(16),margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FB), // Light gray background
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Car Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(ImageConstants.serviceBusinessCar),
                  ),
                  const SizedBox(width: 16),

                  /// Car Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title + Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Business Class",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: const [
                                Text(
                                  "3030.94 €",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down, size: 20),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        /// Icons Row
                        Row(
                          children: const [
                            Icon(Icons.person, size: 16),
                            SizedBox(width: 4),
                            Text("3"),
                            SizedBox(width: 12),
                            Icon(Icons.luggage, size: 16),
                            SizedBox(width: 4),
                            Text("2"),
                          ],
                        ),
                        const SizedBox(height: 8),

                        /// Description
                        const Text(
                          "Most popular – Mercedes-Benz E-Class or similar",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const SizedBox(height: 20),
            Text(
              "Total Price",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 10),
            /// Total Card
            Container(
              width: 600,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "3030.94 €",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                text: 'Change',
                width: 150,
                height: 50,
                borderRadius: 5,
                borderColor: appTheme.black,
                textColor: appTheme.black,
                backgroundColor: appTheme.whiteCustom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
