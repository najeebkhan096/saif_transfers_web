import 'package:flutter/material.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';

class AllClassesIncludeSection extends StatelessWidget {
  const AllClassesIncludeSection({super.key});

  static const List<String> features = [
    "Free cancellation up until 1 hour before pickup",
    "Free 60 minutes of wait time",
    "Meet & Greet",
    "Complimentary bottle of water",
  ];
  static const List<String> notes = [
    "Guest/luggage capacities must be abided by for safety reasons. If you are unsure, select a larger class as chauffeurs may turn down service when they are exceeded.",
    "The vehicle images above are examples. You may get a different vehicle o similar quality.",
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide = constraints.maxWidth >= 720;
        const double gap = 16;
        final width = MediaQuery.of(context).size.width;

        return Container(

          padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
          decoration: BoxDecoration(
            color: appTheme.whiteCustom,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFFE5E7EB),
            ), // light gray border
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "All classes include:",
                style: TextStyle(
                  fontSize: 14,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF111827), // dark gray text
                ),
              ),
              const SizedBox(height: 12),

              Wrap(
                spacing: gap,
                runSpacing: 12,
                children: features.map((t) {
                  final double w = isWide
                      ? (constraints.maxWidth - gap) / 2
                      : constraints.maxWidth;
                  return SizedBox(
                    width: w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ring bullet
                        Container(
                          margin: const EdgeInsets.only(top: 2.5),
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff64666B),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 10, // smaller so it fits neatly inside the circle
                            color: Colors.white, // matches the design
                          ),
                        )
,
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            t,
                            style: const TextStyle(
                              fontSize: 13,
                              height: 1.35,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              const Text(
                "Please note:",
                style: TextStyle(
                  fontSize: 14,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF111827), // dark gray text
                ),
              ),
              const SizedBox(height: 12),

              Wrap(
                spacing: gap,
                runSpacing: 12,
                children: notes.map((t) {
                  final double w = isWide
                      ? (constraints.maxWidth - gap) / 2
                      : constraints.maxWidth;
                  return SizedBox(
                    width: w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ring bullet
                        const Icon(
                          Icons.info,

                          size: 20, // smaller so it fits neatly inside the circle
                          color: Color(0xff64666B),
                        ),

                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            t,
                            style: const TextStyle(
                              fontSize: 13,
                              height: 1.35,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
