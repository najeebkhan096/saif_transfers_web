import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/styling.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

import '../../../theme/theme_helper.dart';
import '../elements/triple_section.dart';

class PaymentFormSection extends StatelessWidget {
  const PaymentFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 700),
        margin: appPaddingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: isMobile ? 20 : 20.h),
            BookRideTripInfoSection(),
            SizedBox(height: isMobile ? 40 : 40.h),

            /// Title
            Text(
              "Add credit card",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w600,
                fontSize: isMobile ? 24 : 24.sp,
              ),
            ),

            SizedBox(height: isMobile ? 20 : 20.h),

            /// Card Details Form
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
                  _PaymentInputField(
                    label: "Name on Card*",
                    hint: "Enter name as shown on card",
                    isMobile: isMobile,
                  ),
                  SizedBox(height: isMobile ? 20 : 20.h),

                  _PaymentInputField(
                    label: "Card Number*",
                    hint: "1234 5678 9101 1121",
                    isMobile: isMobile,
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomImageView(imagePath: ImageConstants.masterCard),
                        SizedBox(width: isMobile ? 6 : 6.w),
                        CustomImageView(imagePath: ImageConstants.visaCard),
                        SizedBox(width: isMobile ? 6 : 6.w),
                        CustomImageView(
                          imagePath: ImageConstants.americanCard,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isMobile ? 20 : 20.h),

                  Row(
                    children: [
                      Expanded(
                        child: _PaymentInputField(
                          label: "Expiration date*",
                          hint: "MM / YY",
                          isMobile: isMobile,
                        ),
                      ),
                      SizedBox(width: isMobile ? 12 : 12.w),
                      Expanded(
                        child: _PaymentInputField(
                          label: "CVV*",
                          hint: "123",
                          isMobile: isMobile,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: isMobile ? 20 : 20.h),

                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (val) {}),
                      Text(
                        "Save card to your list",
                        style: GoogleFonts.dmSans(
                          fontSize: isMobile ? 12 : 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: isMobile ? 20 : 20.h),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffE3E5EA)),
                borderRadius: BorderRadius.circular(isMobile ? 10 : 10.r),
              ),
              child: Column(
                children: [
                  _InfoBox(
                    icon: ImageConstants.doneIcon,
                    text:
                    "Your card details are securely processed and never stored.",
                    isMobile: isMobile,
                  ),
                  SizedBox(height: isMobile ? 4 : 4.h),
                  Divider(color: const Color(0xffE3E5EA)),
                  SizedBox(height: isMobile ? 4 : 4.h),
                  _InfoBox(
                    icon: ImageConstants.safety,
                    text:
                    "We use industry-standard encryption to protect your information.",
                    isMobile: isMobile,
                  ),
                ],
              ),
            ),

            SizedBox(height: isMobile ? 100 : 100.h),
          ],
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
  final bool isMobile;

  const _PaymentInputField({
    required this.label,
    required this.hint,
    required this.isMobile,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
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
        suffixIcon: suffix,
      ),
    );
  }
}

/// Styled Info Box
class _InfoBox extends StatelessWidget {
  final String icon;
  final String text;
  final bool isMobile;

  const _InfoBox({
    required this.icon,
    required this.text,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 12 : 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: icon,
            width: isMobile ? 18 : 18.w,
            height: isMobile ? 18 : 18.h,
          ),
          SizedBox(width: isMobile ? 8 : 8.w),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 12 : 12.sp,
                color: appTheme.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
