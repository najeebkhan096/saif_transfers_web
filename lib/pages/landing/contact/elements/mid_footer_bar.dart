
/* --------------------------- MID FOOTER BAR --------------------------- */

import 'package:flutter/material.dart';

import '../../../../core/utils/images.dart';
import '../../../../widgets/custom_image_view.dart';

class MidFooterBar extends StatelessWidget {
  const MidFooterBar({super.key});
  @override
  Widget build(BuildContext context) {
    final maxW = 1180.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE9E9E9))),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxW),
          child: Row(
            children: [
              CustomImageView(
                imagePath: ImageConstants.logo,
                width: 60,
                height: 60,
              ),
              const SizedBox(width: 25),
              CustomImageView(
                imagePath: ImageConstants.call,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 6),
              const Text('+1800900122'),
              const Spacer(),
              const Text('Follow Us', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 10),
              CustomImageView(
                imagePath: ImageConstants.facebook,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 10),
              CustomImageView(
                imagePath: ImageConstants.twitter,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 10),
              CustomImageView(
                imagePath: ImageConstants.skype,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 10),
              CustomImageView(
                imagePath: ImageConstants.instagram,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 10),
              CustomImageView(
                imagePath: ImageConstants.linkedin,
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
