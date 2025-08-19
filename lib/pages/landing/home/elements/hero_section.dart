// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/app_colors.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

import '../../../../theme/theme_helper.dart';
import '../../../../widgets/custom_button.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return SizedBox(
      height: isMobile ? 1040 : 768,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background Image
          CustomImageView(
            imagePath: ImageConstants.bgCar,
            fit: BoxFit.cover,
            width: double.infinity,
            height: isMobile ? 300 : 717,
            radius: BorderRadius.circular(20),
          ),

          // Text Content
          Positioned(
            left: isMobile ? 20 : 100,
            top: isMobile ? 100 : 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Where Would You Like To Go?",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.dmSans(
                      fontSize: isMobile ? 28.sp : 50.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: "A New Class Of ",
                        style: const TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Luxury",
                        style: TextStyle(color: appTheme.primaryColor),
                      ),
                      TextSpan(
                        text: "\nAirport Travel Service",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white),
                  ),
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        'View More Fleet',
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

          // Booking Form Card
          Positioned(
            top: isMobile ? 320 : 104,
            right: isMobile ? null : 100,
            child: Card(
              color: appTheme.whiteCustom,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 664,
                width: 420,
                padding: const EdgeInsets.all(20),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        indicatorColor: appTheme.black,
                        indicatorWeight: 3,
                        labelColor: appTheme.black,
                        unselectedLabelColor: appTheme.gray400,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: const [
                          Tab(text: "One Way"),
                          Tab(text: "Hourly"),
                        ],
                      ),
                      SizedBox(height: 40),
                      Expanded(
                        child: TabBarView(
                          children: const [_BookingForm(), _BookingForm()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingForm extends StatelessWidget {
  const _BookingForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _BookingTextField(
          icon: ImageConstants.pickupLocation,
          hint: "Pickup Location",
          subtitle: 'London City Airport',
        ),
        SizedBox(height: 25),
        const _BookingTextField(
          icon: ImageConstants.dropLocation,
          hint: "Drop Location",
          subtitle: 'London City Blackheath',
        ),
        SizedBox(height: 25),
        const _BookingTextField(
          icon: ImageConstants.dateIcon,
          hint: "Date",
          subtitle: '2025-05-03',
        ),
        SizedBox(height: 25),
        const _BookingTextField(
          icon: ImageConstants.timeIcon,
          hint: "Time",
          subtitle: '6:00 AM',
        ),
        SizedBox(height: 25),
        DottedCustomButton(
          textColor: AppColor().black,
          color: const Color(0xff8E8E8E),
          onPressed: () {},
          text: 'Add Return',
        ),
        SizedBox(height: 25),
        CustomButton(
          margin: EdgeInsets.zero,
          borderRadius: 5,
          height: 56,
          onPressed: () {},
          text: 'Submit',
        ),
      ],
    );
  }
}

class _BookingTextField extends StatelessWidget {
  final String icon;
  final String hint;
  final String subtitle;

  const _BookingTextField({
    required this.icon,
    required this.hint,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: appTheme.formBackgroundColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: appTheme.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: CustomImageView(imagePath: icon, height: 20, width: 20)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hint,
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF181A1F),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF181A1F),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
