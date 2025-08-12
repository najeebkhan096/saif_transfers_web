// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:saif_transfers_web/model/driver.dart';

import 'DriverListItem.dart';
import 'section_title.dart';

/// Top Drivers List
class TopDriversList extends StatelessWidget {
  final List<DriverModel> drivers;

  const TopDriversList({super.key, required this.drivers});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 320,
        maxWidth: 380,
        maxHeight: 580,
      ),
      padding: const EdgeInsets.only(left: 24, top: 8,right: 24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Top Drivers'),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: drivers.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (context, index) =>
                  DriverListItem(driver: drivers[index]),
            ),
          ),
        ],
      ),
    );
  }
}
