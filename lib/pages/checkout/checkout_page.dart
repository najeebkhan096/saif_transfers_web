import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saif_transfers_web/pages/checkout/carSummary/car_summary_section_page.dart';
import 'package:saif_transfers_web/pages/checkout/elements/triple_section.dart';
import 'package:saif_transfers_web/pages/checkout/peymentSection/payment_form_page.dart';
import 'package:saif_transfers_web/pages/checkout/pickupInfo/pick_up_info_page.dart';
import 'package:saif_transfers_web/pages/checkout/elements/header_section.dart';
import 'package:saif_transfers_web/pages/checkout/serviceClass/service_class_page.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';

import '../../providers/stepper_provider.dart';

/// -------- Main Checkout Page --------
class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return ServiceClassPage();
      case 1:
        return PickupInfoPage();
      case 2:
        return PaymentFormSection();
      case 3:
        return CarSummarySection();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CheckoutStepperProvider(),
      child: Consumer<CheckoutStepperProvider>(
        builder: (context, stepper, _) {
          return Scaffold(
            backgroundColor: appTheme.whiteCustom,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: appTheme.whiteCustom,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View terms and conditions',
                    style: TextStyle(
                      fontSize: 14,
                      color: appTheme.black,
                      decoration: TextDecoration.underline,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 30),
                  CustomButton(
                    width: 180,
                    margin: EdgeInsets.zero,
                    height: 36,
                    borderRadius: 10,
                    borderColor: appTheme.coloF6F6F6,
                    text: stepper.currentStep < 2
                        ? 'Continue'
                        : stepper.currentStep == 3
                        ? 'Proceed too Checkout'
                        : 'Confirm Booking',
                    textColor: appTheme.whiteCustom,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    onPressed: () {
                      stepper.nextStep();
                    },
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                CheckOutHeaderSection(),
                SizedBox(height: 20),
                if (stepper.currentStep != 2) Center(child: CheckOutTripInfoSection()),
                SizedBox(height: 20),

                /// Step Content
                Expanded(child: _buildStepContent(stepper.currentStep)),
              ],
            ),
          );
        },
      ),
    );
  }
}
