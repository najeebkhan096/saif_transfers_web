
import 'package:flutter/material.dart';

/// =================== FOOTER ===================
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey.shade200,
      child: Column(
        children: const [
          Text("LOGO HERE", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("© 2025 Luxury Airport Travel - All rights reserved")
        ],
      ),
    );
  }
}
