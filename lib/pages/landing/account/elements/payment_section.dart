import 'package:flutter/material.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payment",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        CustomButton(
          text: 'Add new card',
          iconPath: ImageConstants.addIcon,
          fontWeight: FontWeight.w600,
          borderRadius: 10,
          height: 50,
          backgroundColor: appTheme.whiteCustom,
          borderColor: appTheme.black,
          textColor: appTheme.black,

        ),
      ],
    );
  }
}
