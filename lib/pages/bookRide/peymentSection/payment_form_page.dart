import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

import '../../../theme/theme_helper.dart';
import '../elements/triple_section.dart';

class PaymentFormSection extends StatelessWidget {
  const PaymentFormSection({super.key});

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
              const SizedBox(height: 20),
              BookRideTripInfoSection(),
              const SizedBox(height: 40),

              /// Title
              Text(
                "Add credit card",
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 20),

              /// Card Details Form
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE3E5EA)),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name on Card
                    _PaymentInputField(
                      label: "Name on Card*",
                      hint: "Enter name as shown on card",
                    ),
                    const SizedBox(height: 20),

                    /// Card Number with logos
                    _PaymentInputField(
                      label: "Card Number*",
                      hint: "1234 5678 9101 1121",
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageView(imagePath: ImageConstants.masterCard),
                          const SizedBox(width: 6),
                          CustomImageView(imagePath: ImageConstants.visaCard),
                          const SizedBox(width: 6),
                          CustomImageView(
                            imagePath: ImageConstants.americanCard,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// Expiration + CVV
                    Row(
                      children: [
                        Expanded(
                          child: _PaymentInputField(
                            label: "Expiration date*",
                            hint: "MM / YY",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _PaymentInputField(label: "CVV*", hint: "123"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// Save Card Checkbox
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (val) {}),
                        Text(
                          "Save card to your list",
                          style: GoogleFonts.dmSans(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),


            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffE3E5EA)),
                borderRadius: BorderRadius.circular(10),
              ),
              // padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  /// Info Sections
                  _InfoBox(
                    icon: ImageConstants.doneIcon,
                    text:
                    "Your card details are securely processed and never stored.",
                  ),
                  const SizedBox(height: 4),
                  Divider(color: Color(0xffE3E5EA),),
                  const SizedBox(height: 4),
                  _InfoBox(
                    icon: ImageConstants.safety,
                    text:
                    "We use industry-standard encryption to protect your information.",
                  ),
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

/// Styled InputField for Payment
class _PaymentInputField extends StatelessWidget {
  final String label;
  final String hint;
  final Widget? suffix;

  const _PaymentInputField({
    required this.label,
    required this.hint,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: label,
        hintStyle: GoogleFonts.dmSans(
          color: appTheme.black,
          fontWeight: FontWeight.w300,
          fontSize: 12,
        ),
        filled: true,
        fillColor: const Color(0xffF6F6F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffF6F6F6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffF6F6F6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffF6F6F6)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        suffixIcon: suffix,
      ),
    );
  }
}

/// Styled Info Box
class _InfoBox extends StatelessWidget {
  final String icon;
  final String text;

  const _InfoBox({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(imagePath: icon,width: 18,height: 18,),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.dmSans(fontSize: 12, color: appTheme.black),
            ),
          ),
        ],
      ),
    );
  }
}
