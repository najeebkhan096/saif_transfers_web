// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
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
  int selectedTab = 0; // 0 = One Way, 1 = Hourly

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 900;

    return SizedBox(
      height: isMobile ? 820 : 720,

      child: Stack(
        children: [
          // Background Image
          CustomImageView(
            imagePath: ImageConstants.bgCar,
            fit: BoxFit.cover,
            width: double.infinity,
            height: isMobile ? 820 : 720,
            radius: BorderRadius.circular(20),
          ),

          // Dark overlay for readability
          Container(
            width: double.infinity,
            height: isMobile ? 820 : 720,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.3),
            ),
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
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 26 : 38,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: "A New Class Of ",
                        style: const TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Luxury",
                        style: TextStyle(
                          color: appTheme.primaryColor,
                        ), // gold color
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
                    borderRadius:BorderRadius.circular(5),
                    border: Border.all(color: appTheme.white),
                  ),
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        'View More Fleet',
                        style: GoogleFonts.dmSans().copyWith(
                          color: appTheme.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      CustomImageView(imagePath: ImageConstants.learnMore,width: 12,height: 12,color: appTheme.white,)
                    ],
                  ),
                ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.black,
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 20,
                //       vertical: 14,
                //     ),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(6),
                //     ),
                //   ),
                //   onPressed: () {},
                //   child: Text(
                //     "View More Fleet",
                //     style: GoogleFonts.inter(fontSize: 14, color: Colors.white),
                //   ),
                // ),
              ],
            ),
          ),

          // Booking Form Card with Tabs
          Positioned(
            right: isMobile ? 20 : 80,
            top: isMobile ? 250 : 150,
            child: Container(
              width: isMobile ? MediaQuery.of(context).size.width - 80 : 360,
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
              child: DefaultTabController(
                length: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TabBar(
                      indicatorColor: appTheme.black, // underline color
                      indicatorWeight: 3, // underline thickness
                      labelColor: appTheme.black,
                      unselectedLabelColor: appTheme.gray400,
                      indicatorSize: TabBarIndicatorSize.label,

                      tabs: const [
                        Tab(text: "One Way"),
                        Tab(text: "Hourly"),
                      ],
                    ),
                    const SizedBox(height: 15),

                    SizedBox(
                      height: 440, // form height
                      child: TabBarView(
                        children: [_BookingForm(), _BookingForm()],
                      ),
                    ),
                  ],
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
        _BookingTextField(
          icon: ImageConstants.pickupLocation,
          hint: "Pickup Location",
          subtitle: 'London City Airport',
        ),
        const SizedBox(height: 10),
        _BookingTextField(
          icon: ImageConstants.dropLocation,
          hint: "Drop Location",
          subtitle: 'London City Blackheath',
        ),
        const SizedBox(height: 10),
        _BookingTextField(
          icon: ImageConstants.dateIcon,
          hint: "Date",
          subtitle: '2025-05-03',
        ),
        const SizedBox(height: 10),
        _BookingTextField(
          icon: ImageConstants.timeIcon,
          hint: "Time",
          subtitle: '6:00 AM',
        ),
        const SizedBox(height: 20),

        DottedCustomButton(
          textColor: AppColor().black,
          color: Color(0xff8E8E8E),
          onPressed: () {},
          text: 'Add Return',
          // textColor: appTheme.black,
          // backgroundColor: appTheme.transparentCustom,
        ),
        const SizedBox(height: 15),
        CustomButton(
          margin: EdgeInsets.zero,
          borderRadius: 5,
          height: 50,
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
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: appTheme.formBackgroundColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leading Icon Container
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: appTheme.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: CustomImageView(
                imagePath: icon,
                height: 20,
                width: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Texts (Title + Subtitle)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hint,
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF181A1F),
                    fontSize: 14,
                    fontWeight: FontWeight.bold
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
