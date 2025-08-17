import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';

import '../../../model/service_class_info.dart';
import '../../../widgets/custom_image_view.dart';
import '../elements/triple_section.dart';
import 'elements/all_classes_include_section.dart';

class ServicesListSection extends StatefulWidget {
  final List<ServiceClassInfo> services;

  const ServicesListSection({
    super.key,
    required this.services,
  });

  @override
  State<ServicesListSection> createState() => _ServicesListSectionState();
}

class _ServicesListSectionState extends State<ServicesListSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    final contentMaxWidth = width > 1200 ? 760.0 : width * 0.68;

    final double titleSize = isMobile ? 14 : 16;
    final double priceSize = isMobile ? 14 : 18;
    final double descSize = isMobile ? 12 : 13;
    final double iconSize = isMobile ? 14 : 16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.only(
            left: isMobile ? 6 : 4,
            bottom: isMobile ? 8 : 12,
          ),
          child: Text(
            'All prices include VAT, fees, and tolls',
            style: TextStyle(
              fontSize: isMobile ? 12 : 13,
              color: Colors.black54,
            ),
          ),
        ),

        Column(
          children: List.generate(widget.services.length, (index) {
            final service = widget.services[index];
            final selected = index == selectedIndex;

            return GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: selected ? const Color(0xFFF2F4F6) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: selected ? Colors.black87 : Colors.grey.shade300,
                    width: selected ? 2 : 1,
                  ),
                  boxShadow: selected
                      ? [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                      : null,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 10 : 14,
                    vertical: isMobile ? 10 : 14,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Car Image
                      CustomImageView(imagePath: service.imageUrl),

                      SizedBox(width: isMobile ? 10 : 16),

                      // Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.title,
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: appTheme.black,
                              ),
                            ),
                            const SizedBox(height: 8),

                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: iconSize,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  service.capacity.toString(),
                                  style: TextStyle(
                                    fontSize: descSize,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Icon(
                                  Icons.card_travel,
                                  size: iconSize,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  service.luggage.toString(),
                                  style: TextStyle(
                                    fontSize: descSize,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            Text(
                              service.description,
                              style: GoogleFonts.dmSans(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: appTheme.black,
                              ),
                              // maxLines: 2,
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                      // Price + Chevron
                      SizedBox(width: isMobile ? 8 : 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${service.price.toStringAsFixed(2)} €',
                            style: TextStyle(
                              fontSize: priceSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: isMobile ? 8 : 12),
                          Icon(
                            selected
                                ? Icons.expand_less
                                : Icons.expand_more,
                            size: isMobile ? 20 : 22,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),


      ],
    );
  }
}
