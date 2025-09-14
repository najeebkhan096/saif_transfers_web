import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

import '../../../providers/stepper_provider.dart';

class BookRideHeaderSection extends StatelessWidget {
  const BookRideHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final activeStep = context.watch<CheckoutStepperProvider>().currentStep;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 730;

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
            vertical:  16,
            horizontal:  24,
          ),
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top row → Logo + Menu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageView(
                    imagePath: ImageConstants.logo,
                    width: 100.w,
                    fit: BoxFit.fill,
                  ),

                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Icon(
                      Icons.menu_rounded,
                      size: isMobile ? 22 : 22.sp,
                    ),
                    splashRadius: isMobile ? 20 : 20.r,
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 16 : 16.h),

              // Stepper below in horizontal scroll
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
                  isMobile: true,
                ),
              ),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              CustomImageView(
                imagePath: ImageConstants.logo,
                width: 100.w,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 40.w),

              // Stepper Center
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: width > 1200 ? 800.w : width * 0.7,
                    ),
                    child: StepperHeader(
                      steps: const [
                        'Service Class',
                        'Pickup Info',
                        'Payment',
                        'Checkout',
                      ],
                      activeStep: activeStep,
                      isMobile: false,
                    ),
                  ),
                ),
              ),

              // Menu button
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(Icons.menu_rounded, size: 22.sp),
                splashRadius: 22.r,
              ),
            ],
          ),
        );
      },
    );
  }
}

class StepperHeader extends StatelessWidget {
  final List<String> steps;
  final int activeStep;
  final bool isMobile;

  const StepperHeader({
    super.key,
    required this.steps,
    required this.activeStep,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final double circleSize = isMobile?14:16;
    final double fontSize = isMobile?11:13;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < steps.length; i++) ...[
          _buildStep(steps[i], i, circleSize, fontSize),
          if (i != steps.length - 1)
            Container(
              width:  60,
              height:  1.5,
              color: i < activeStep ? Colors.black : Colors.grey.shade300,
              margin: EdgeInsets.symmetric(horizontal: 6),
            ),
        ],
      ],
    );
  }

  Widget _buildStep(
      String label,
      int index,
      double circleSize,
      double fontSize,
      ) {
    final bool isActive = index == activeStep;
    final bool isCompleted = index < activeStep;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive || isCompleted
                ? Colors.black87
                : Colors.grey.shade400,
          ),
        ),
        SizedBox(height: isMobile ? 6 : 6.h),
        Container(
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted
                ? Colors.black
                : (isActive ? Colors.white : Colors.white),
            border: Border.all(
              color: isCompleted
                  ? Colors.black
                  : (isActive ? Colors.black : Colors.grey.shade300),
              width:  1.5,
            ),
          ),
        ),
      ],
    );
  }
}
