import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saif_transfers_web/pages/bookRide/peymentSection/payment_form_page.dart';
import 'package:saif_transfers_web/pages/bookRide/pickupInfo/pick_up_info_page.dart';
import 'package:saif_transfers_web/pages/bookRide/serviceClass/service_class_page.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';

import '../../core/routes.dart';
import '../../core/utils/images.dart';
import '../../providers/navigation.dart';
import '../../providers/stepper_provider.dart';
import 'carSummary/car_summary_section_page.dart';
import 'elements/header_section.dart';
import 'elements/triple_section.dart';

/// -------- Main Checkout Page --------
class BookRidePage extends StatelessWidget {
  const BookRidePage({super.key});

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
    final navigationProvider = context.watch<NavigationProvider>();

    // Find the current page index
    int currentIndex = [
      'Home',
      'Book a Ride',
      'My Account',
      'Contact',
    ].indexOf(navigationProvider.activeItem);
    if (currentIndex == -1) currentIndex = 0;

    return ChangeNotifierProvider(
      create: (_) => CheckoutStepperProvider(),
      child: Consumer<CheckoutStepperProvider>(
        builder: (context, stepper, _) {
          return Scaffold(
            endDrawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(child: Image.asset(ImageConstants.logo)),
                  for (var title in [
                    'Home',
                    'Book a Ride',
                    'My Account',
                    'Contact',
                    'Admin Side',
                  ])
                    ListTile(
                      title: Text(title),
                      selected: navigationProvider.activeItem == title,
                      selectedColor: Colors.blue,
                      onTap: () {
                        if (title == 'Admin Side') {
                          Navigator.of(context).pop(); // close drawer first
                          Navigator.pushNamed(
                            context,
                            AppRoutes.adminLoginPage,
                          );
                        } else {
                          navigationProvider.setActiveItem(title);
                          Navigator.of(context).pop(); // close drawer
                        }
                      },
                    ),
                ],
              ),
            ),
            backgroundColor: appTheme.whiteCustom,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: appTheme.whiteCustom,
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
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
                        : stepper.currentStep == 2
                        ? 'Proceed to Checkout'
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
                BookRideHeaderSection(),

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
