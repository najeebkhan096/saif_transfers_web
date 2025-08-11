import 'package:flutter/material.dart';
import '../../../theme/theme_helper.dart';
import 'elements/booking_row.dart';
import 'elements/booking_tab_header.dart';
import 'elements/booking_tabs.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  int selectedTab = 0;
  final Set<int> selectedBookings = {};

  final List<String> tabs = [
    "Pending (5)",
    "In progress (1)",
    "Completed (70)",
    "Upcoming (0)",
    "Pre-cancelled (26)",
    "Cancelled by driver (1)"
  ];

  final List<Map<String, String>> bookings = [
    {
      "name": "Sierra Ferguson",
      "phone": "+998 (99) 436-46-15",
      "car": "Simple",
      "date": "04.12.2024",
      "time": "20:30",
      "start": "n.p. Eesu Arau, Furkat Street, Tashkent, O’zbekiston",
      "end": "n.p. Eesu Arau, Furkat Street, Munich, Germany",
      "income": "300 EUR",
      "avatar":    "https://corsproxy.io/?https://pbs.twimg.com/media/GwOH6kVakAAt66Y?format=jpg&name=large",
    },
    {
      "name": "Sierra Ferguson",
      "phone": "+998 (99) 436-46-15",
      "car": "Premium",
      "date": "04.12.2024",
      "time": "20:24",
      "start": "21 Hamidulla Oripov ko‘chasi, Tashkent, O’zbekiston",
      "end": "n.p. Eesu Arau, Furkat Street, Munich, Germany",
      "income": "300 EUR",
      "avatar": "https://corsproxy.io/?https://www.punjabkesari.com/wp-content/uploads/2025/07/aneet-padda-26.webp",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appTheme.whiteCustom,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookingsTabs(
            tabs: tabs,
            selectedTab: selectedTab,
            onTabChanged: (index) => setState(() => selectedTab = index),
          ),
          const SizedBox(height: 10),
          const BookingsTableHeader(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final b = bookings[index];
                return BookingRow(
                  booking: b,
                  isSelected: selectedBookings.contains(index),
                  onSelected: (value) {
                    setState(() {
                      if (value) {
                        selectedBookings.add(index);
                      } else {
                        selectedBookings.remove(index);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


