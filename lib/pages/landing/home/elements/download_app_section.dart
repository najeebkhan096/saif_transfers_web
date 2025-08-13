import 'package:flutter/material.dart';
import 'package:saif_transfers_web/core/utils/images.dart';

/// =================== DOWNLOAD APP ===================
class DownloadAppSection extends StatelessWidget {
  const DownloadAppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          alignment: Alignment.centerRight,
          image: AssetImage(ImageConstants.downloadBanner),
        ),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Download the app",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 20),
          const Text(
            "Have a personal driver at your fingertips no matter where you are with our easy-to-use smartphone app.",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 12,
            alignment: WrapAlignment.start,
            children: [
              // App Store button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  backgroundColor: Color(0xffFFFFFF).withOpacity(0.11),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.apple, color: Colors.white),
                label: const Text(
                  "App Store",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),

              // Play Store button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  backgroundColor: Color(0xffFFFFFF).withOpacity(0.11),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                label: const Text(
                  "Play Store",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
