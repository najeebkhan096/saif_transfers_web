/* --------------------------- OFFICES GRID --------------------------- */

import 'package:flutter/material.dart';

import '../../../../core/utils/images.dart';
import '../../../../widgets/custom_image_view.dart';

class OfficesSection extends StatelessWidget {
  const OfficesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final offices = [
      _OfficeData(
        city: 'Frankfurt Office',
        address: 'PO Box 16122 Collins Street West\nVictoria 8007 Australia',
        phone: '+32 2 512 08 15',
        email: 'newyork@company.com',
        icon: ImageConstants.londonIcon, // placeholder for line art statue
      ),
      const _OfficeData(
        city: 'Istanbul Office',
        address: 'PO Box 16122 Collins Street West\nVictoria 8007 Australia',
        phone: '+32 2 512 08 15',
        email: 'istanbul@company.com',
        icon: ImageConstants.istanbulIcon, // placeholder for line art statue
      ),
      const _OfficeData(
        city: 'Paris Office',
        address: 'PO Box 16122 Collins Street West\nVictoria 8007 Australia',
        phone: '+32 2 512 08 15',
        email: 'paris@company.com',
        icon: ImageConstants.parisIcon, // placeholder for line art statue
      ),
      const _OfficeData(
        city: 'London Office',
        address: 'PO Box 16122 Collins Street West\nVictoria 8007 Australia',
        phone: '+32 2 512 08 15',
        email: 'london@company.com',
        icon: ImageConstants.londonIcon, // placeholder for line art statue
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: List.generate(offices.length, (index) {
          return _OfficeCard(data: offices[index]);
        }),
      ),
    );
  }
}

class _OfficeData {
  final String city, address, phone, email;
  final String icon;
  const _OfficeData({
    required this.city,
    required this.address,
    required this.phone,
    required this.email,
    required this.icon,
  });
}

class _OfficeCard extends StatelessWidget {
  final _OfficeData data;
  const _OfficeCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(imagePath: data.icon),
          const SizedBox(height: 20),
          Text(
            data.city,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(data.address, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text(data.phone, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text(data.email, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
