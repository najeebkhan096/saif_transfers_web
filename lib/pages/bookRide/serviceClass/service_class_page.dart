import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/pages/bookRide/serviceClass/service_list_section.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';
import '../../../core/routes.dart';
import '../../../model/service_class_info.dart';
import '../../../providers/navigation.dart';
import '../elements/triple_section.dart';
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
    final width = MediaQuery.of(context).size.width;

    final isMobile = width < 700;

    final contentMaxWidth = isMobile
        ? 500.0
        : width > 1200
        ? 500.0
        : width * 0.58;
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: contentMaxWidth),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              color: appTheme.whiteCustom,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookRideTripInfoSection(),
                    SizedBox(height: 20),

                    ServicesListSection(services: serviceClasses),
                    const SizedBox(height: 20),
                    AllClassesIncludeSection(),
                    const SizedBox(height: 80),
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
