import 'package:flutter/material.dart';
import 'package:saif_transfers_web/model/driver.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';

import '../../../model/booking.dart';
import '../bookings/elements/booking_row.dart';
import '../bookings/elements/booking_tab_header.dart';
import 'elements/OverviewCardsRow.dart';
import 'elements/StatisticChartSection.dart';
import 'elements/TopDriversList.dart';
import 'elements/section_title.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  static final List<DriverModel> topDrivers = [
    DriverModel(
      firstName: 'Gina',
      lastName: 'Garza',
      birthDate: '1992-03-05',
      state: 'Active',
      homeLocation: 'Samarkand',
      workLocation: 'Samarkand City',
      avatar:
          'https://corsproxy.io/?https://randomuser.me/api/portraits/women/2.jpg',
      phone: '+998 (99) 158-10-15',
      orders: 5,
      income: 15,
    ),
    DriverModel(
      firstName: 'Brian',
      lastName: 'Reed',
      birthDate: '1988-07-21',
      state: 'Active',
      homeLocation: 'Bukhara',
      workLocation: 'Bukhara City',
      avatar:
          'https://corsproxy.io/?https://randomuser.me/api/portraits/men/3.jpg',
      phone: '+998 (95) 489-46-20',
      orders: 5,
      income: 23,
    ),
    DriverModel(
      firstName: 'Tammy',
      lastName: 'Spencer',
      birthDate: '1991-11-12',
      state: 'Active',
      homeLocation: 'Khiva',
      workLocation: 'Khiva City',
      avatar:
          'https://corsproxy.io/?https://randomuser.me/api/portraits/women/4.jpg',
      phone: '+998 (95) 785-10-02',
      orders: 5,
      income: 98,
    ),
    DriverModel(
      firstName: 'Joseph',
      lastName: 'Brooks',
      birthDate: '1990-06-18',
      state: 'Active',
      homeLocation: 'Navoi',
      workLocation: 'Navoi City',
      avatar:
          'https://corsproxy.io/?https://randomuser.me/api/portraits/men/5.jpg',
      phone: '+998 (99) 436-46-15',
      orders: 5,
      income: 98,
    ),
    DriverModel(
      firstName: 'Juan',
      lastName: 'Steward',
      birthDate: '1989-05-22',
      state: 'Active',
      homeLocation: 'Andijan',
      workLocation: 'Andijan City',
      avatar:
          'https://corsproxy.io/?https://randomuser.me/api/portraits/men/6.jpg',
      phone: '+998 (99) 436-46-15',
      orders: 5,
      income: 98,
    ),
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/10.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/15.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/20.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/22.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/25.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/30.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/35.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/40.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/45.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/50.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/55.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/60.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/65.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/70.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/75.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/80.jpg",
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
      avatarUrl:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/85.jpg",
    ),
  ];

  final Set<int> selectedBookings = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: appTheme.whiteCustom,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          // Define breakpoints (adjust as needed)
          const desktopBreakpoint = 1024;
          const tabletBreakpoint = 768;

          if (width >= desktopBreakpoint) {
            // Desktop layout: Row with Overview/Chart, Drivers, and Bookings (stacked)
            // Inside your LayoutBuilder desktop breakpoint condition (width >= 1024)

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top section: Overview + Chart + Drivers side by side with independent scrolling
                SizedBox(
                  height: 600,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left: Overview + Chart (scrollable)
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SectionTitle(title: 'Overview'),
                              SizedBox(height: 20),
                              OverviewCardsRow(),
                              SizedBox(height: 36),
                              StatisticChartSection(),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 32),

                      // Right: Top Drivers List (scrollable)
                      Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: TopDriversList(drivers: topDrivers),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Bottom section: Bookings Header + List with fixed height + scrolling
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
              ],
            );
          } else if (width >= tabletBreakpoint) {
            // Tablet layout: Stack Overview, Chart, Drivers vertically, then Bookings
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(title: 'Overview'),
                  const SizedBox(height: 20),
                  const OverviewCardsRow(),
                  const SizedBox(height: 36),
                  const StatisticChartSection(),
                  const SizedBox(height: 32),
                  TopDriversList(drivers: topDrivers),
                  const SizedBox(height: 32),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                ],
              ),
            );
          } else {
            // Mobile layout: All stacked vertically, compact spacing
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(title: 'Overview'),
                  const SizedBox(height: 12),
                  const OverviewCardsRow(),
                  const SizedBox(height: 24),
                  const StatisticChartSection(),
                  const SizedBox(height: 24),
                  TopDriversList(drivers: topDrivers),
                  const SizedBox(height: 24),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
