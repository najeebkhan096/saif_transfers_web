import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/styling.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';

import '../elements/triple_section.dart';

class CarSummarySection extends StatelessWidget {
  const CarSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final bool isMobile = MediaQuery.of(context).size.width < 900;

        return Center(
          child: Container(
            margin: appPaddingHorizontal,
            width: isMobile ? double.infinity : 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(height: 20.h),
                Text(
                  "Booking Details",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: isMobile ? 20 : 24,
                  ),
                ),
                  SizedBox(height: 20.h),
                BookRideTripInfoSection(),
                  SizedBox(height: 20.h),
                Text(
                  "Ride Details",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: isMobile ? 20 : 24,
                  ),
                ),

                const SizedBox(height: 10),

                /// Car Details Card
                Container(
                  padding: EdgeInsets.all(isMobile ? 12 : 16),
                  decoration: BoxDecoration(
                    color: isMobile ? Colors.white : const Color(0xFFF5F7FB),
                    borderRadius: BorderRadius.circular(isMobile ? 0 : 10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Car Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          ImageConstants.serviceBusinessCar,
                          width: isMobile ? 80 : null,
                          height: isMobile ? 60 : null,

                        ),
                      ),
                      const SizedBox(width: 16),

                      /// Car Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Title + Price
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Business Class",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: isMobile ? 14 : 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "3030.94 €",
                                      style: GoogleFonts.dmSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: isMobile ? 14 : 16,
                                      ),
                                    ),
                                    if (!isMobile)
                                      const Icon(Icons.keyboard_arrow_down,
                                          size: 20),
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
                            Text(
                              "Most popular – Mercedes-Benz E-Class or similar",
                              style: GoogleFonts.dmSans(
                                fontSize: isMobile ? 12 : 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                  SizedBox(height: 20.h),
                Text(
                  "Total Price",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: isMobile ? 20 : 24,
                  ),
                ),

                const SizedBox(height: 10),

                /// Total Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 12 : 16,
                    vertical: isMobile ? 10 : 14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7FB),
                    borderRadius: BorderRadius.circular(isMobile ? 0 : 8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.dmSans(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "3030.94 €",
                        style: GoogleFonts.dmSans(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    text: 'Change',
                    width: isMobile ? 120 : 150,
                    height: isMobile ? 44 : 50,
                    borderRadius: 5,
                    borderColor: appTheme.black,
                    textColor: appTheme.black,
                    backgroundColor: appTheme.whiteCustom,
                  ),
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        );
      },
    );
  }
}
