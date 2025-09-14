import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saif_transfers_web/core/styling.dart';
import 'package:saif_transfers_web/pages/landing/contact/elements/mid_footer_bar.dart';
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
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeroSection(),
          SizedBox(height: 40),
          const HowItWorksSection(),
          SizedBox(height: 40),
          const ServicesSection(),
          const FleetSection(),
          ShowcaseSection(),
          TestimonialsSection(),
          PartnersSection(),
          DownloadAppSection(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 60),
            child: MidFooterBar(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 60),

            child: ResponsiveFooter(
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
                  items: [
                    'New York',
                    'London',
                    'Berlin',
                    'Los Angeles',
                    'Paris',
                  ],
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
          ),
          LegalBar(
            margin: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 60),
          ),

          // FooterSection(),
        ],
      ),
    );
  }
}
