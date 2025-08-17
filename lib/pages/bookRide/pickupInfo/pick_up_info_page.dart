import 'package:flutter/material.dart';
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
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              BookRideTripInfoSection(),
              SizedBox(height: 40),
              Text(
                "Select who you are booking for",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              _BookingTypeSelector(
                bookingType: bookingType,
                onChanged: (value) => setState(() => bookingType = value),
              ),
              const SizedBox(height: 20),
              Text(
                "Provide additional information",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 10),
              Text(
                "Enter your flight number to ensure your driver can track your flight and adjust the pickup time.",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: appTheme.greyCustom,
                ),
              ),

              const SizedBox(height: 20),
              _InputField(
                label: "Flight Number",
                hint: "e.g. LH 202, U24567, BA2490",
              ),

              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE3E5EA)),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PickupSignCard(name: "Ahmed Hussain Mujtaba"),
                    const SizedBox(height: 15),
                    _NotesField(),
                  ],
                ),
              ),
              const SizedBox(height: 100),
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE3E5EA)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          RadioListTile<String>(
            value: "myself",
            activeColor: appTheme.black,
            groupValue: bookingType,
            onChanged: (val) {},
            title: const Text("Book For Myself"),
          ),
          RadioListTile<String>(
            value: "someone",
            groupValue: bookingType,
            onChanged: (val) {},
            title: const Text("Book For Someone Else"),
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE3E5EA)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Flight Number',
                hintStyle: GoogleFonts.dmSans(
                  color: appTheme.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
                filled: true, // 👈 important
                fillColor: Color(0xffF6F6F6), // 👈 now it will work
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffF6F6F6)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffF6F6F6)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffF6F6F6)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              hint,
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w400,
                fontSize: 10,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffF6F6F6)),
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffF6F6F6),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pickup sign",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                name,
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),
        Text(
          "It will appear on your driver’s pickup sign when they meet you.",
          style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w400,
            fontSize: 10,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Notes for the driver',
            hintStyle: GoogleFonts.dmSans(
              color: appTheme.black,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
            filled: true, // 👈 important
            fillColor: Color(0xffF6F6F6), // 👈 now it will work
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffF6F6F6)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffF6F6F6)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffF6F6F6)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Add special requests, e.g. number of bags, child seats, etc. Please do not include confidential information.',
          style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: appTheme.black,
          ),
        ),
      ],
    );
  }
}
