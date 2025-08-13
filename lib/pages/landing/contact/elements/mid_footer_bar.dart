
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
              const SizedBox(width: 16),
              const Icon(Icons.phone, size: 16),
              const SizedBox(width: 6),
              const Text('+1800900122'),
              const Spacer(),
              const Text('Follow Us', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 10),
              const Icon(Icons.facebook_rounded, size: 18),
              const SizedBox(width: 10),
              const Icon(Icons.close_rounded, size: 18), // placeholder for X
              const SizedBox(width: 10),
              const Icon(Icons.call, size: 18),
              const SizedBox(width: 10),
              const Icon(Icons.camera_alt_outlined, size: 18),
              const SizedBox(width: 10),
              const Icon(Icons.linked_camera_outlined, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
