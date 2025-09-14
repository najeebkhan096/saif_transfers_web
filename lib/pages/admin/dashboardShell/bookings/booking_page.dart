import 'package:flutter/material.dart';
import '../../../../model/booking.dart';
import '../../../../theme/theme_helper.dart';
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
    "Cancelled by driver (1)",
  ];

  final List<Booking> bookings = [
    Booking(
      name: "Sierra Ferguson",
      phone: "+998 (99) 436-46-15",
      car: "Simple",
      date: "04.12.2024",
      time: "20:30",
      start: "n.p. Eesu Arau, Furkat Street, Tashkent, O’zbekiston",
      end: "n.p. Eesu Arau, Furkat Street, Munich, Germany",
      income: "300 EUR",
      avatarUrl:
      "https://corsproxy.io/?https://pbs.twimg.com/media/GwOH6kVakAAt66Y?format=jpg&name=large",
    ),
    Booking(
      name: "Sierra Ferguson",
      phone: "+998 (99) 436-46-15",
      car: "Premium",
      date: "04.12.2024",
      time: "20:24",
      start: "21 Hamidulla Oripov ko‘chasi, Tashkent, O’zbekiston",
      end: "n.p. Eesu Arau, Furkat Street, Munich, Germany",
      income: "300 EUR",
      avatarUrl:
      "https://corsproxy.io/?https://www.punjabkesari.com/wp-content/uploads/2025/07/aneet-padda-26.webp",
    ),
    Booking(
      name: "Liam Smith",
      phone: "+1 (555) 123-4567",
      car: "Luxury",
      date: "15.01.2025",
      time: "14:45",
      start: "123 Main St, New York, USA",
      end: "456 Park Ave, New York, USA",
      income: "150 USD",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/10.jpg",
    ),
    Booking(
      name: "Emma Johnson",
      phone: "+44 7700 900123",
      car: "Standard",
      date: "22.01.2025",
      time: "09:00",
      start: "10 Downing St, London, UK",
      end: "Buckingham Palace, London, UK",
      income: "120 GBP",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/15.jpg",
    ),
    Booking(
      name: "Noah Brown",
      phone: "+61 400 123 456",
      car: "Simple",
      date: "28.02.2025",
      time: "18:30",
      start: "Sydney Opera House, Sydney, Australia",
      end: "Bondi Beach, Sydney, Australia",
      income: "80 AUD",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/20.jpg",
    ),
    Booking(
      name: "Olivia Williams",
      phone: "+33 1 23 45 67 89",
      car: "Premium",
      date: "03.03.2025",
      time: "11:15",
      start: "Eiffel Tower, Paris, France",
      end: "Louvre Museum, Paris, France",
      income: "130 EUR",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/22.jpg",
    ),
    Booking(
      name: "James Miller",
      phone: "+49 170 1234567",
      car: "Luxury",
      date: "10.03.2025",
      time: "20:00",
      start: "Brandenburg Gate, Berlin, Germany",
      end: "Berlin TV Tower, Berlin, Germany",
      income: "200 EUR",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/25.jpg",
    ),
    Booking(
      name: "Isabella Davis",
      phone: "+81 90 1234 5678",
      car: "Simple",
      date: "15.04.2025",
      time: "07:30",
      start: "Shinjuku, Tokyo, Japan",
      end: "Shibuya, Tokyo, Japan",
      income: "7000 JPY",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/30.jpg",
    ),
    Booking(
      name: "William Garcia",
      phone: "+52 55 1234 5678",
      car: "Standard",
      date: "22.04.2025",
      time: "19:45",
      start: "Zócalo, Mexico City, Mexico",
      end: "Chapultepec Park, Mexico City, Mexico",
      income: "1200 MXN",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/35.jpg",
    ),
    Booking(
      name: "Sophia Martinez",
      phone: "+34 600 123 456",
      car: "Premium",
      date: "30.04.2025",
      time: "13:00",
      start: "Plaza Mayor, Madrid, Spain",
      end: "Royal Palace, Madrid, Spain",
      income: "110 EUR",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/40.jpg",
    ),
    Booking(
      name: "Benjamin Rodriguez",
      phone: "+1 (555) 987-6543",
      car: "Luxury",
      date: "05.05.2025",
      time: "22:15",
      start: "Hollywood Blvd, Los Angeles, USA",
      end: "Santa Monica Pier, Los Angeles, USA",
      income: "250 USD",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/45.jpg",
    ),
    Booking(
      name: "Mia Hernandez",
      phone: "+55 11 91234 5678",
      car: "Simple",
      date: "12.05.2025",
      time: "16:00",
      start: "Avenida Paulista, São Paulo, Brazil",
      end: "Ibirapuera Park, São Paulo, Brazil",
      income: "150 BRL",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/50.jpg",
    ),
    Booking(
      name: "Michael Wilson",
      phone: "+27 82 123 4567",
      car: "Standard",
      date: "18.05.2025",
      time: "08:30",
      start: "Table Mountain, Cape Town, South Africa",
      end: "V&A Waterfront, Cape Town, South Africa",
      income: "900 ZAR",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/55.jpg",
    ),
    Booking(
      name: "Ella Moore",
      phone: "+44 7400 123456",
      car: "Premium",
      date: "25.05.2025",
      time: "21:00",
      start: "Tower of London, London, UK",
      end: "London Eye, London, UK",
      income: "140 GBP",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/60.jpg",
    ),
    Booking(
      name: "Alexander Taylor",
      phone: "+1 (555) 555-5555",
      car: "Luxury",
      date: "01.06.2025",
      time: "19:00",
      start: "Times Square, New York, USA",
      end: "Central Park, New York, USA",
      income: "300 USD",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/65.jpg",
    ),
    Booking(
      name: "Grace Anderson",
      phone: "+61 412 345 678",
      car: "Simple",
      date: "08.06.2025",
      time: "12:30",
      start: "Federation Square, Melbourne, Australia",
      end: "Royal Botanic Gardens, Melbourne, Australia",
      income: "100 AUD",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/70.jpg",
    ),
    Booking(
      name: "Daniel Thomas",
      phone: "+49 171 2345678",
      car: "Standard",
      date: "15.06.2025",
      time: "17:45",
      start: "Neuschwanstein Castle, Bavaria, Germany",
      end: "Marienplatz, Munich, Germany",
      income: "160 EUR",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/75.jpg",
    ),
    Booking(
      name: "Chloe Jackson",
      phone: "+81 80 1234 5678",
      car: "Premium",
      date: "22.06.2025",
      time: "09:15",
      start: "Osaka Castle, Osaka, Japan",
      end: "Dotonbori, Osaka, Japan",
      income: "8000 JPY",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/80.jpg",
    ),
    Booking(
      name: "Matthew White",
      phone: "+1 (555) 678-9012",
      car: "Luxury",
      date: "30.06.2025",
      time: "23:00",
      start: "Golden Gate Bridge, San Francisco, USA",
      end: "Fisherman's Wharf, San Francisco, USA",
      income: "270 USD",
      avatarUrl: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/85.jpg",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
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
            Column(
              children: List.generate(bookings.length, (index) {
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
              }),
            ),
          ],
        ),
      ),
    );
  }
}
