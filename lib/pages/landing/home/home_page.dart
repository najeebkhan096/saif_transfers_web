import 'package:flutter/material.dart';
import 'package:saif_transfers_web/core/styling.dart';
import 'package:saif_transfers_web/widgets/big_footer.dart';
import 'package:saif_transfers_web/widgets/legal_bar.dart';
import 'elements/HowItWorksSection.dart';
import 'elements/download_app_section.dart';
import 'elements/fleet_section.dart';
import 'elements/hero_section.dart';
import 'elements/partner_section.dart';
import 'elements/service_section.dart';
import 'elements/stats_section.dart';
import 'elements/testimonial_section.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: appPaddingHorizontal,
        child: Column(
          children: [
            SizedBox(height: 20,),
            const HeroSection(),
            const HowItWorksSection(),
            const ServicesSection(),
            const FleetSection(),
             ShowcaseSection(),
            TestimonialsSection(),
            PartnersSection(),
             DownloadAppSection(),
            ResponsiveFooter(
              sections: [
                FooterSection(
                  title: 'Company',
                  items: const [
                    'About us',
                    'Our offerings',
                    'Newsroom',
                    'Investors',
                    'Blog',
                    'Careers',
                    'Gift cards',
                  ],
                ),
                 FooterSection(
                  title: 'Top cities',
                  items: ['New York', 'London', 'Berlin', 'Los Angeles', 'Paris'],
                ),
                 FooterSection(
                  title: 'Explore',
                  items: [
                    'Intercity rides',
                    'Limousine service',
                    'Chauffeur service',
                    'Private car service',
                    'Ground transportation',
                    'Airport transfer',
                  ],
                ),
                 FooterSection(
                  title: 'Classes',
                  items: ['Business', 'First', 'XL', 'Assistant'],
                ),
              ],
            ),
            const LegalBar(),

            // FooterSection(),
          ],
        ),
      ),
    );
  }
}