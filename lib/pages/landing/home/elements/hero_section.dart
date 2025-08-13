// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

import '../../../../theme/theme_helper.dart';
import '../../../../widgets/custom_button.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  int selectedTab = 0; // 0 = One Way, 1 = Hourly

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 900;

    return SizedBox(
      height: isMobile ? 700 : 650,
      child: Stack(
        children: [
          // Background Image
          SizedBox(
            width: double.infinity,
            height: isMobile ? 700 : 650,
            child: Image.asset(ImageConstants.bgCar, fit: BoxFit.cover),
          ),

          // Dark overlay for readability
          Container(
            width: double.infinity,
            height: isMobile ? 500 : 650,
            color: Colors.black.withOpacity(0.3),
          ),

          // Text Content
          Positioned(
            left: isMobile ? 20 : 80,
            top: isMobile ? 60 : 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Where Would You Like To Go?",
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 14 : 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "A New Class Of Luxury\nAirport Travel Service",
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 26 : 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "View More Fleet",
                    style: GoogleFonts.inter(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Booking Form Card
          Positioned(
            right: isMobile ? 20 : 80,
            top: isMobile ? 250 : 150,
            child: Container(
              width: isMobile ? MediaQuery.of(context).size.width - 40 : 360,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Tabs
                  Row(
                    children: [
                      _BookingTab(
                        title: "One Way",
                        selected: selectedTab == 0,
                        onTap: () {
                          setState(() => selectedTab = 0);
                        },
                      ),
                      _BookingTab(
                        title: "Hourly",
                        selected: selectedTab == 1,
                        onTap: () {
                          setState(() => selectedTab = 1);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  _BookingTextField(
                    icon: ImageConstants.pickupLocation,
                    hint: "Pickup Location",
                  ),
                  const SizedBox(height: 10),
                  _BookingTextField(
                    icon: ImageConstants.dropLocation,
                    hint: "Drop Location",
                  ),
                  const SizedBox(height: 10),
                  _BookingTextField(
                    icon: ImageConstants.dateIcon,
                    hint: "Date",
                  ),
                  const SizedBox(height: 10),
                  _BookingTextField(icon: ImageConstants.timeIcon, hint: "Time"),
                  const SizedBox(height: 10),

                  CustomButton(
                    margin: EdgeInsets.zero,
                    borderRadius: 5,
                    height: 36,
                    borderColor: appTheme.black,
                    onPressed: () {},
                    text: 'Add Return',
                    textColor: appTheme.black,
                    backgroundColor: appTheme.transparentCustom,
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    margin: EdgeInsets.zero,
                    borderRadius: 5,
                    height: 36,
                    borderColor: appTheme.red,
                    onPressed: () {},
                    text: 'Submit',
                    backgroundColor: appTheme.red,
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

class _BookingTab extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _BookingTab({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? Colors.black : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: GoogleFonts.inter(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _BookingTextField extends StatelessWidget {
  final String icon;
  final String hint;

  const _BookingTextField({
    required this.icon,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: appTheme.formBackgroundColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          CustomImageView(
            imagePath: icon,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              hint,
              style: GoogleFonts.dmSans(
                color: const Color(0xFF181A1F),
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

