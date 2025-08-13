import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/images.dart';
import '../../../providers/stepper_provider.dart';

class CheckOutHeaderSection extends StatelessWidget {
  const CheckOutHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final activeStep = context.watch<CheckoutStepperProvider>().currentStep;

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
        border: const Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 14 : 20,
        horizontal: isMobile ? 16 : 24,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImageConstants.logo,
                      height: isMobile ? 32 : 42,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu_rounded, size: 26),
                      splashRadius: 22,
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: StepperHeader(
                    steps: const [
                      'Service Class',
                      'Pickup Info',
                      'Payment',
                      'Checkout',
                    ],
                    activeStep: activeStep,
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageConstants.logo, height: isMobile ? 32 : 42),
                const SizedBox(width: 24),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: width > 1200 ? 800.0 : width * 0.65,
                      ),
                      child: StepperHeader(
                        steps: const [
                          'Service Class',
                          'Pickup Info',
                          'Payment',
                          'Checkout',
                        ],
                        activeStep: activeStep,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu_rounded, size: 28),
                  splashRadius: 22,
                ),
              ],
            ),
    );
  }


}

class StepperHeader extends StatelessWidget {
  final List<String> steps;
  final int activeStep;

  const StepperHeader({super.key, required this.steps, this.activeStep = 0});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1024;

    final double circleSize = isMobile
        ? 14
        : isTablet
        ? 16
        : 18;
    final double fontSize = isMobile
        ? 12
        : isTablet
        ? 12.5
        : 13;
    final double labelVerticalSpacing = isMobile ? 8 : 10;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < steps.length; i++) ...[
          _buildStep(
            steps[i],
            i == activeStep,
            circleSize,
            fontSize,
            labelVerticalSpacing,
          ),
          if (i != steps.length - 1)
            Container(
              height: 2,
              width: isMobile
                  ? 28
                  : isTablet
                  ? 40
                  : 50,
              margin: EdgeInsets.symmetric(
                horizontal: isMobile
                    ? 10
                    : isTablet
                    ? 16
                    : 22,
              ),
              color: i < activeStep ? Colors.black : Colors.grey.shade300,
            ),
        ],
      ],
    );
  }

  Widget _buildStep(
    String label,
    bool active,
    double circleSize,
    double fontSize,
    double labelVerticalSpacing,
  ) {
    final labelWidget = active
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F4F6),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black.withOpacity(0.06),
                width: 1,
              ),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          )
        : Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          );

    final circle = Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: active ? Colors.black87 : Colors.grey.shade400,
          width: active ? 2 : 1.5,
        ),
        boxShadow: active
            ? [
                const BoxShadow(
                  color: Color(0x10000000),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: active
          ? Center(
              child: Container(
                width: circleSize * 0.45,
                height: circleSize * 0.45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            )
          : null,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        labelWidget,
        SizedBox(height: labelVerticalSpacing),
        circle,
      ],
    );
  }
}
