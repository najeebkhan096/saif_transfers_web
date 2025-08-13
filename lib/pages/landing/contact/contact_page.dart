import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saif_transfers_web/widgets/googleMap.dart';
import '../../../widgets/big_footer.dart';
import 'elements/form_section.dart';
import 'elements/hero_banner.dart';
import '../../../widgets/legal_bar.dart';
import 'elements/mid_footer_bar.dart';
import 'elements/office_section.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeroBanner(),
          const OfficesSection(),
          SizedBox(
            height: 500,
            child: GoogleMapWidget(initialPosition: LatLng(33.6996, 73.0362)),
          ),
          const FormSection(),
          const MidFooterBar(),
          ResponsiveFooter(
            sections: [
              FooterSection(
                title: 'Company',
                items: [
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
        ],
      ),
    );
  }
}
