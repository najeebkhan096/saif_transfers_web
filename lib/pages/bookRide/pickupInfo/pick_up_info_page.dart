import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Text(
                "Select who you are booking for",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
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
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 10),
              Text(
                "Enter your flight number to ensure your driver can track your flight and adjust the pickup time.",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 20),
              _InputField(
                label: "Flight Number",
                hint: "e.g. LH 202, U24567, BA2490",
              ),
              const SizedBox(height: 20),
              _PickupSignCard(name: "Ahmed Hussain Mujtaba"),
              const SizedBox(height: 20),
              _NotesField(),
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
        border: Border.all(color: Color(0xffE3E5EA)),
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffF6F6F6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE3E5EA)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pickup sign",
              style: GoogleFonts.inter(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "It will appear on your driver’s pickup sign when they meet you.",
              style: GoogleFonts.inter(color: Colors.grey[700], fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotesField extends StatelessWidget {
  const _NotesField();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE3E5EA)),
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffF6F6F6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notes for the driver",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText:
                    "Add special requests, e.g. number of bags, child seats, etc. Please do not include confidential information.",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
