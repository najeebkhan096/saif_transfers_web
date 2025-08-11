import 'package:flutter/material.dart';

/// =================== DOWNLOAD APP ===================
class DownloadAppSection extends StatelessWidget {
  const DownloadAppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.black,
      child: Column(
        children: [
          const Text("Download the app",
              style: TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  child: const Text("App Store")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  child: const Text("Play Store")),
            ],
          )
        ],
      ),
    );
  }
}
