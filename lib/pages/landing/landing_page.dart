import 'package:flutter/material.dart';
import 'package:saif_transfers_web/pages/landing/elements/HowItWorksSection.dart';


import '../../core/utils/images.dart';
import 'elements/fleet_section.dart';
import 'elements/header_section.dart';
import 'elements/hero_section.dart';
import 'elements/service_section.dart';
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Image.asset(ImageConstants.logo)),
            ListTile(title: Text('Home')),
            ListTile(title: Text('Book a Ride')),
            ListTile(title: Text('My Account')),
            ListTile(title: Text('Contact')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderSection(),
            HeroSection(),
            HowItWorksSection(),
            ServicesSection(),
            FleetSection(),
            // StatsSection(),
            // TestimonialsSection(),
            // PartnersSection(),
            // DownloadAppSection(),
            // FooterSection(),
          ],
        ),
      ),
    );
  }
}