import 'package:flutter/material.dart';
import 'package:saif_transfers_web/core/utils/images.dart';

/// =================== PARTNERS ===================
class PartnersSection extends StatelessWidget {
  const PartnersSection({super.key});

  final List<String> mparteners = const [
    ImageConstants.partner1,
    ImageConstants.partner2,
    ImageConstants.partner3,
    ImageConstants.partner4,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          double imageWidth = isMobile
              ? 80
              : constraints.maxWidth < 800
              ? 100
              : 120;

          return Container(
            padding: const EdgeInsets.only(left: 20),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.start,
              children: [
                // Heading
                Text(
                  "The partners who continuous travel with us",
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 50,),

                // Partner logos
                ...List.generate(
                  mparteners.length,
                      (index) => Image.asset(
                    mparteners[index],
                    width: imageWidth,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
