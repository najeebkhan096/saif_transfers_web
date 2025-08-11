
import 'package:flutter/material.dart';

/// =================== PARTNERS ===================
class PartnersSection extends StatelessWidget {
  const PartnersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Wrap(
        spacing: 20,
        alignment: WrapAlignment.center,
        children: List.generate(
            4,
                (index) => Image.network("https://via.placeholder.com/120x50",
                width: 120)),
      ),
    );
  }
}
