/* --------------------------- MID FOOTER BAR --------------------------- */

import 'package:flutter/material.dart';
import '../../../../core/utils/images.dart';
import '../../../../widgets/custom_image_view.dart';

class MidFooterBar extends StatelessWidget {
  const MidFooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE9E9E9))),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 600;

          if (isMobile) {
            // ---------- MOBILE: stacked ----------
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstants.logo,
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 12),
                    CustomImageView(
                      imagePath: ImageConstants.call,
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(width: 6),
                    const Text('+1800900122'),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    const Text('Follow Us', style: TextStyle(fontSize: 14)),
                    CustomImageView(imagePath: ImageConstants.facebook, width: 20, height: 20),
                    CustomImageView(imagePath: ImageConstants.twitter, width: 20, height: 20),
                    CustomImageView(imagePath: ImageConstants.skype, width: 20, height: 20),
                    CustomImageView(imagePath: ImageConstants.instagram, width: 20, height: 20),
                    CustomImageView(imagePath: ImageConstants.linkedin, width: 20, height: 20),
                  ],
                ),
              ],
            );
          } else {
            // ---------- DESKTOP/TABLET: row ----------
            return Row(
              children: [
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstants.logo,
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(width: 25),
                    CustomImageView(
                      imagePath: ImageConstants.call,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 6),
                    const Text('+1800900122'),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text('Follow Us', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 10),
                    CustomImageView(imagePath: ImageConstants.facebook, width: 20, height: 20),
                    const SizedBox(width: 10),
                    CustomImageView(imagePath: ImageConstants.twitter, width: 20, height: 20),
                    const SizedBox(width: 10),
                    CustomImageView(imagePath: ImageConstants.skype, width: 20, height: 20),
                    const SizedBox(width: 10),
                    CustomImageView(imagePath: ImageConstants.instagram, width: 20, height: 20),
                    const SizedBox(width: 10),
                    CustomImageView(imagePath: ImageConstants.linkedin, width: 20, height: 20),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
