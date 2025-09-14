import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    final maxW = 1180.0;
    return Container(
      color: Colors.black,
      height: 312,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 80),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contact',
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 35 : 44.w,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Home  >  Contact',
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 15 : 14,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
