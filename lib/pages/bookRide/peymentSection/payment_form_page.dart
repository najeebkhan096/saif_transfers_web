import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

class PaymentFormSection extends StatelessWidget {
  const PaymentFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300),
      borderRadius: borderRadius,
    );

    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "Add credit card",
            style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Card Details Form
              Container(
                width: 500,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius,
                border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name on Card
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Name on Card*',
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        filled: true,
                        fillColor: Colors.grey.shade100,
                      ),
                    ),
                    const SizedBox(height: 12),

                    /// Card Number + Logos
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Card Number*',
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        suffixIcon: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstants.masterCard,
                              ),
                              SizedBox(width: 4),
                              CustomImageView(imagePath: ImageConstants.visaCard),
                              SizedBox(width: 4),
                              CustomImageView(
                                imagePath: ImageConstants.americanCard,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// Expiration + CVV
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Expiration date*',
                              hintText: 'MM / YY',
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                              filled: true,
                              fillColor: Colors.grey.shade100,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'CVV*',
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                              filled: true,
                              fillColor: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    /// Save Card Checkbox
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text("Save card to your list"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              /// Info Sections
              _infoBox(
                Icons.info_outline,
                "It will appear on your driver's pickup sign when they meet you.",
              ),
              const SizedBox(height: 8),
              _infoBox(
                Icons.warning_amber_rounded,
                "It will appear on your driver's pickup sign when they meet you.",
              ),
            ],
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }

  /// Helper for info boxes
  Widget _infoBox(IconData icon, String text) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
