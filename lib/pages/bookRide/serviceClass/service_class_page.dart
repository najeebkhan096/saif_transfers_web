import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/pages/bookRide/serviceClass/service_list_section.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import '../../../model/service_class_info.dart';
import '../elements/triple_section.dart';
import 'elements/all_classes_include_section.dart';

// Entry point widget
class ServiceClassPage extends StatefulWidget {
  const ServiceClassPage({super.key});

  @override
  _ServiceClassPageState createState() => _ServiceClassPageState();
}

class _ServiceClassPageState extends State<ServiceClassPage> {
  int selectedIndex = 0;

  final List<ServiceClassInfo> serviceClasses = [
    ServiceClassInfo(
      title: "Business Class",
      capacity: 3,
      luggage: 2,
      description: "Most popular – Mercedes-Benz E-Class or similar",
      price: 3030.94,
      imageUrl: ImageConstants.serviceBusinessVanCar,
    ),
    ServiceClassInfo(
      title: "Electric Class",
      capacity: 3,
      luggage: 2,
      description: "Most eco-friendly – Mercedes-Benz EQE or similar",
      price: 3030.94,
      imageUrl: ImageConstants.serviceElectricCar,
    ),
    ServiceClassInfo(
      title: "Business Van/SUV",
      capacity: 5,
      luggage: 5,
      description: "More spacious – Mercedes-Benz V-Class or similar",
      price: 3003.31,
      imageUrl: ImageConstants.serviceBusinessVanCar,
    ),
    ServiceClassInfo(
      title: "First Class",
      capacity: 3,
      luggage: 2,
      description: "Most luxurious – Mercedes-Benz S-Class or similar",
      price: 8554.62,
      imageUrl: ImageConstants.serviceFirstClassCar,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    final double contentMaxWidth = 500;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isMobile ? contentMaxWidth : contentMaxWidth.w,
              ),
              width: double.infinity,
               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              //
              color: appTheme.whiteCustom,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookRideTripInfoSection(),
                    SizedBox(height: 20.h),
                    ServicesListSection(services: serviceClasses),
                    SizedBox(height: 20.h),
                    AllClassesIncludeSection(),
                    SizedBox(height: 80.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
