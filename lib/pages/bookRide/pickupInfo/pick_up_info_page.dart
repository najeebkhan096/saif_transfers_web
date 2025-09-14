import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';

import '../elements/triple_section.dart';

class PickupInfoPage extends StatefulWidget {
  const PickupInfoPage({super.key});

  @override
  State<PickupInfoPage> createState() => _PickupInfoPageState();
}

class _PickupInfoPageState extends State<PickupInfoPage> {
  String bookingType = "myself";

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 20.w,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isMobile ? 700 : 700.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: isMobile ? 20 : 20.h),
              const BookRideTripInfoSection(),
              SizedBox(height: isMobile ? 40 : 40.h),
              Text(
                "Select who you are booking for",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile ? 24 : 24.sp,
                ),
              ),
              SizedBox(height: isMobile ? 20 : 20.h),
              _BookingTypeSelector(
                bookingType: bookingType,
                onChanged: (value) => setState(() => bookingType = value),
              ),
              SizedBox(height: isMobile ? 20 : 20.h),
              Text(
                "Provide additional information",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile ? 24 : 24.sp,
                ),
              ),

              SizedBox(height: isMobile ? 10 : 10.h),
              Text(
                "Enter your flight number to ensure your driver can track your flight and adjust the pickup time.",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w400,
                  fontSize: isMobile ? 12 : 12.sp,
                  color: appTheme.greyCustom,
                ),
              ),

              SizedBox(height: isMobile ? 20 : 20.h),
              const _InputField(
                label: "Flight Number",
                hint: "e.g. LH 202, U24567, BA2490",
              ),

              SizedBox(height: isMobile ? 20 : 20.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE3E5EA)),
                  borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
                ),
                padding: EdgeInsets.all(isMobile ? 16 : 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _PickupSignCard(name: "Ahmed Hussain Mujtaba"),
                    SizedBox(height: isMobile ? 15 : 15.h),
                    const _NotesField(),
                  ],
                ),
              ),
              SizedBox(height: isMobile ? 100 : 100.h),
            ],
          ),
        ),
      ),
    );
  }
}

// -------------------- COMPONENTS --------------------

class _BookingTypeSelector extends StatelessWidget {
  final String bookingType;
  final ValueChanged<String> onChanged;

  const _BookingTypeSelector({
    required this.bookingType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE3E5EA)),
        borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
      ),
      child: Column(
        children: [
          RadioListTile<String>(
            value: "myself",
            activeColor: appTheme.black,
            groupValue: bookingType,
            onChanged: (val){},
            title: Text(
              "Book For Myself",
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 14 : 14.sp,
              ),
            ),
          ),
          RadioListTile<String>(
            value: "someone",
            groupValue: bookingType,
            onChanged: (val){},
            title: Text(
              "Book For Someone Else",
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 14 : 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final String hint;

  const _InputField({required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE3E5EA)),
        borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 16 : 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Flight Number',
                hintStyle: GoogleFonts.dmSans(
                  color: appTheme.black,
                  fontWeight: FontWeight.w300,
                  fontSize: isMobile ? 12 : 12.sp,
                ),
                filled: true,
                fillColor: const Color(0xffF6F6F6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
                  borderSide: const BorderSide(color: Color(0xffF6F6F6)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
                  borderSide: const BorderSide(color: Color(0xffF6F6F6)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
                  borderSide: const BorderSide(color: Color(0xffF6F6F6)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : 12.w,
                  vertical: isMobile ? 12 : 12.h,
                ),
              ),
            ),
            SizedBox(height: isMobile ? 10 : 10.h),
            Text(
              hint,
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w400,
                fontSize: isMobile ? 10 : 10.sp,
                color: appTheme.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PickupSignCard extends StatelessWidget {
  final String name;

  const _PickupSignCard({required this.name});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffF6F6F6)),
            borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
            color: const Color(0xffF6F6F6),
          ),
          padding: EdgeInsets.all(isMobile ? 12 : 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pickup sign",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile ? 12 : 12.sp,
                ),
              ),
              SizedBox(height: isMobile ? 4 : 4.h),
              Text(
                name,
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile ? 12 : 12.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: isMobile ? 8 : 8.h),
        Text(
          "It will appear on your driver’s pickup sign when they meet you.",
          style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w400,
            fontSize: isMobile ? 10 : 10.sp,
            color: appTheme.black,
          ),
        ),
      ],
    );
  }
}

class _NotesField extends StatelessWidget {
  const _NotesField();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Notes for the driver',
            hintStyle: GoogleFonts.dmSans(
              color: appTheme.black,
              fontWeight: FontWeight.w300,
              fontSize: isMobile ? 12 : 12.sp,
            ),
            filled: true,
            fillColor: const Color(0xffF6F6F6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
              borderSide: const BorderSide(color: Color(0xffF6F6F6)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
              borderSide: const BorderSide(color: Color(0xffF6F6F6)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
              borderSide: const BorderSide(color: Color(0xffF6F6F6)),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 12.w,
              vertical: isMobile ? 12 : 12.h,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 10 : 10.h),
        Text(
          'Add special requests, e.g. number of bags, child seats, etc. Please do not include confidential information.',
          style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w400,
            fontSize: isMobile ? 10 : 10.sp,
            color: appTheme.black,
          ),
        ),
      ],
    );
  }
}
