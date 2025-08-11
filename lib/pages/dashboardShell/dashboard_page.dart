import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // Sample data for drivers
  static final List<Driver> topDrivers = [
    Driver(
      name: 'Maharrm Hasanli',
      phone: '+998 (99) 436-46-15',
      orders: 5,
      income: 98,
      avatarUrl: 'https://corsproxy.io/?https://randomuser.me/api/portraits/men/1.jpg',
    ),
    Driver(
      name: 'Gina Garza',
      phone: '+998 (99) 158-10-15',
      orders: 5,
      income: 15,
      avatarUrl: 'https://corsproxy.io/?https://randomuser.me/api/portraits/women/2.jpg',
    ),
    Driver(
      name: 'Brian Reed',
      phone: '+998 (95) 489-46-20',
      orders: 5,
      income: 23,
      avatarUrl: 'https://corsproxy.io/?https://randomuser.me/api/portraits/men/3.jpg',
    ),
    Driver(
      name: 'Tammy Spencer',
      phone: '+998 (95) 785-10-02',
      orders: 5,
      income: 98,
      avatarUrl: 'https://corsproxy.io/?https://randomuser.me/api/portraits/women/4.jpg',
    ),
    Driver(
      name: 'Joseph Brooks',
      phone: '+998 (99) 436-46-15',
      orders: 5,
      income: 98,
      avatarUrl: 'https://corsproxy.io/?https://randomuser.me/api/portraits/men/5.jpg',
    ),
    Driver(
      name: 'Juan Steward',
      phone: '+998 (99) 436-46-15',
      orders: 5,
      income: 98,
      avatarUrl: 'https://corsproxy.io/?https://randomuser.me/api/portraits/men/6.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Overview + Chart
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SectionTitle(title: 'Overview'),
                SizedBox(height: 16),
                OverviewCardsRow(),
                SizedBox(height: 32),
                StatisticChartSection(),
              ],
            ),
          ),

          // const SizedBox(width: 32),
          //
          // // Right: Top Drivers List
          Expanded(
            flex: 2,
            child: TopDriversList(drivers: topDrivers),
          ),
        ],
      ),
    );
  }
}

// Section title widget for reusability
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Overview Cards Row widget
class OverviewCardsRow extends StatelessWidget {
  const OverviewCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      OverviewCard(title: 'Total Orders', value: '20', color: Colors.blue),
      OverviewCard(title: 'Total Transfers', value: '15', color: Colors.red),
      OverviewCard(title: 'Total Drivers', value: '8', color: Colors.orange),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: cards
          .map((card) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: card,
        ),
      ))
          .toList(),
    );
  }
}

class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const OverviewCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.dmSans(
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}

// Statistic Chart Section widget
class StatisticChartSection extends StatelessWidget {
  const StatisticChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistic',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Text('Progress score', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(width: 16),
              DotLegend(color: Colors.blue, label: 'Average orders'),
              SizedBox(width: 8),
              DotLegend(color: Colors.green, label: 'Transfers'),
            ],
          ),
          const SizedBox(height: 24),
          const SizedBox(height: 200, child: _DashboardLineChart()),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('Aug 2025', style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}

// Dot legend widget for chart legends
class DotLegend extends StatelessWidget {
  final Color color;
  final String label;

  const DotLegend({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}

// Chart widget separated for clarity and possible future logic changes
class _DashboardLineChart extends StatelessWidget {
  const _DashboardLineChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: 1,
              getTitlesWidget: (value, _) {
                const months = [
                  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                ];
                if (value.toInt() >= 0 && value.toInt() < months.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(months[value.toInt()], style: const TextStyle(fontSize: 12)),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 40,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 8),
              FlSpot(1, 14),
              FlSpot(2, 15),
              FlSpot(3, 22),
              FlSpot(4, 20),
              FlSpot(5, 10),
              FlSpot(6, 18),
              FlSpot(7, 15),
              FlSpot(8, 22),
              FlSpot(9, 28),
              FlSpot(10, 30),
              FlSpot(11, 33),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            dotData: FlDotData(show: false),
          ),
          LineChartBarData(
            spots: const [
              FlSpot(0, 12),
              FlSpot(1, 10),
              FlSpot(2, 8),
              FlSpot(3, 7),
              FlSpot(4, 6),
              FlSpot(5, 5),
              FlSpot(6, 10),
              FlSpot(7, 30),
              FlSpot(8, 32),
              FlSpot(9, 35),
              FlSpot(10, 36),
              FlSpot(11, 38),
            ],
            isCurved: true,
            color: Colors.green,
            barWidth: 3,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}

// Top Drivers List widget
class TopDriversList extends StatelessWidget {
  final List<Driver> drivers;

  const TopDriversList({super.key, required this.drivers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Top Drivers'),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: drivers.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) => DriverListItem(driver: drivers[index]),
            ),
          ),
        ],
      ),
    );
  }
}

// Driver data class
class Driver {
  final String name;
  final String phone;
  final int orders;
  final double income;
  final String avatarUrl;

  Driver({
    required this.name,
    required this.phone,
    required this.orders,
    required this.income,
    required this.avatarUrl,
  });
}

// Driver List item widget
class DriverListItem extends StatelessWidget {
  final Driver driver;

  const DriverListItem({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(driver.avatarUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  driver.name,
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  driver.phone,
                  style: GoogleFonts.dmSans(color: Colors.grey.shade600, fontSize: 14),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Orders: ${driver.orders}',
                style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Text(
                'Income: \$${driver.income.toStringAsFixed(0)}',
                style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
