import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

class ShowcaseSection extends StatelessWidget {
  const ShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    final titleSize = isMobile ? 20.0 : 44.0;
    final bodySize = isMobile ? 14.0 : 16.0;
    final statValueSize = isMobile ? 14.0 : 16.0;
    final statLabelSize = isMobile ? 10.0 : 12.0;
    final buttonPadding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 16, vertical: 10)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 16);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisAlignment: isMobile
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          // Gap between image and text for mobile
          if (!isMobile) const SizedBox(width: 120),
          Flexible(
            flex: isMobile ? 0 : 1,
            child: Stack(
              children: [
                CustomImageView(
                  imagePath: ImageConstants.showcaseBanner,
                  width: 448,
                  height: 524,
                ),
                Positioned(
                  left: 12,
                  bottom: 12,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow, size: 18),
                    label: Text(
                      "Play Video",
                          style: GoogleFonts.dmSans(
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Gap between image and text for mobile
          if (isMobile) const SizedBox(height: 20),

          Flexible(
            flex: isMobile ? 0 : 2,
            child: Padding(
              padding: EdgeInsets.only(left: isMobile ? 0 : 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Showcase some\nimpressive numbers.",
                        style: GoogleFonts.dmSans(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1B1B1B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "We boast a remarkable 98% customer satisfaction rate, demonstrating our\n"
                    "commitment to delivering exceptional service and exceeding our clients’\n"
                    "expectations.",
                        style: GoogleFonts.dmSans(
                      fontSize: bodySize,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF5C5C5C),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      StatCard(
                        value: "285",
                        label: "Vehicles",
                        width: isMobile ? 120 : 160,
                        valueSize: statValueSize,
                        labelSize: statLabelSize,
                      ),
                      StatCard(
                        value: "97",
                        label: "Awards",
                        width: isMobile ? 120 : 160,
                        valueSize: statValueSize,
                        labelSize: statLabelSize,
                      ),
                      StatCard(
                        value: "13 k",
                        label: "Happy Customer",
                        width: isMobile ? 150 : 200,
                        valueSize: statValueSize,
                        labelSize: statLabelSize,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white),
                      gradient: LinearGradient(
                        colors: [Color(0xffEFBF04), Color(0xff896D02)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    height: 40,
                    width: 120,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Learn More',
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        CustomImageView(
                          imagePath: ImageConstants.learnMore,
                          width: 12,
                          height: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final double width;
  final double valueSize;
  final double labelSize;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    required this.width,
    required this.valueSize,
    required this.labelSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 81,
     decoration: BoxDecoration(
        border: Border.all(color: appTheme.gray400),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: GoogleFonts.dmSans(
              fontSize: valueSize,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
                style: GoogleFonts.dmSans(
              fontSize: labelSize,
              fontWeight: FontWeight.w400,
              color:appTheme.black
            ),
          ),
        ],
      ),
    );
  }
}
