import 'package:flutter/material.dart';
import 'package:saif_transfers_web/core/utils/images.dart';

/// =================== DOWNLOAD APP ===================
class DownloadAppSection extends StatelessWidget {
  const DownloadAppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        // Responsive scaling factors
        bool isMobile = screenWidth < 600;
        bool isTablet = screenWidth >= 600 && screenWidth < 1024;

        double containerHeight = isMobile
            ? 260
            : isTablet
            ? 340
            : 416;

        double titleFontSize = isMobile
            ? 22
            : isTablet
            ? 32
            : 44;

        double descFontSize = isMobile
            ? 12
            : isTablet
            ? 14
            : 16;

        double paddingLeft = isMobile
            ? 20
            : isTablet
            ? 30
            : 50;

        return Container(
          height: containerHeight,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          padding: EdgeInsets.only(left: paddingLeft, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              alignment: Alignment.centerRight,
              image: AssetImage(ImageConstants.downloadBanner),
              fit: BoxFit.cover,
            ),
            color: Colors.black,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Download the app",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Have a personal driver at your fingertips no matter where you are with our easy-to-use smartphone app.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: descFontSize,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  _buildStoreButton(
                    icon: Icons.apple,
                    title: "Download on",
                    subtitle: "App Store",
                  ),
                  _buildStoreButton(
                    icon: Icons.android, // changed for clarity
                    title: "Download on",
                    subtitle: "Google Play",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStoreButton({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFFFFFF).withOpacity(0.11),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
