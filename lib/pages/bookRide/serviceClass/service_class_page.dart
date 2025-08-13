import 'package:flutter/material.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/pages/bookRide/serviceClass/service_list_section.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';
import '../../../model/service_class_info.dart';
import 'elements/all_classes_include_section.dart';

// Entry point widget
class ServiceClassPage extends StatefulWidget {
  const ServiceClassPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
              width: 160,
              margin: EdgeInsets.zero,
              height: 36,
              borderRadius: 10,
              borderColor: appTheme.coloF6F6F6,
              backgroundColor: appTheme.coloF6F6F6,
              text: 'Continue',
              textColor: appTheme.whiteCustom,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              onPressed: () {},
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: appTheme.whiteCustom,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ServicesListSection(services: serviceClasses),
                    const SizedBox(height: 20),
                    AllClassesIncludeSection(),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
