// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

import '../../../../core/responsive.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context);
    final bool tablet = Responsive.isTablet(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 40,
        vertical: mobile ? 30 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "How It Works",
            style: TextStyle(
              fontSize: mobile ? 22 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 30),
          Flex(
            direction: (mobile || tablet) ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildStep(
                context,
                iconPath: ImageConstants.route,
                title: "Create Your Route",
                desc:
                    "Enter your pickup & dropoff locations or the number of hours you wish to book a car and driver for.",
                mobile: mobile,
                tablet: tablet,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: (mobile || tablet) ? 20 : 0,
                ),
                child: CustomImageView(
                  imagePath: ImageConstants.arrowButton,
                  width: 50,
                ),
              ),
              _buildStep(
                context,
                iconPath: ImageConstants.vehicle,
                title: "Meet Your Driver",
                desc:
                    "You can easily make a reservation through our website, mobile app, or by contacting our customer service team.",
                mobile: mobile,
                tablet: tablet,
              ),

              CustomImageView(imagePath: ImageConstants.arrowButton, width: 50),
              _buildStep(
                context,
                iconPath: ImageConstants.like,
                title: "Receive a Confirmation",
                desc:
                    "Once your booking is received, you'll get a confirmation email or notification with all the details of your reservation.",
                mobile: mobile,
                tablet: tablet,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep(
    BuildContext context, {
    required String iconPath,
    required String title,
    required String desc,
    required bool mobile,
    required bool tablet,
  }) {
    return SizedBox(
      width: mobile
          ? double.infinity
          : (tablet ? MediaQuery.of(context).size.width / 3.5 : 280),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CustomImageView(imagePath: iconPath, width: 50, height: 50),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: mobile ? 16 : 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: TextStyle(
              fontSize: mobile ? 13 : 14,
              height: 1.5,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
