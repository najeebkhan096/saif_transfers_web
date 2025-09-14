// ignore_for_file: deprecated_member_use, file_names
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/DotLegend.dart';

/// Statistic Chart Section
class StatisticChartSection extends StatelessWidget {
  const StatisticChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 10, offset: const Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistic',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Text('Progress score', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(width: 24),
              DotLegend(color: Colors.blue, label: 'Average orders'),
              SizedBox(width: 16),
              DotLegend(color: Colors.green, label: 'Transfers'),
            ],
          ),
          const SizedBox(height: 28),
          const SizedBox(height: 220, child: _DashboardLineChart()),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Aug 2025',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.black87,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// The line chart used in Statistic section
class _DashboardLineChart extends StatelessWidget {
  const _DashboardLineChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 5,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.grey.withOpacity(0.15),
            strokeWidth: 1,
          ),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameWidget: const SizedBox.shrink(),
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
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      months[value.toInt()],
                      style: GoogleFonts.dmSans(fontSize: 13, color: Colors.black54),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 10,
              reservedSize: 32,
              getTitlesWidget: (value, _) {
                if (value % 10 == 0) {
                  return Text(
                    value.toInt().toString(),
                    style: GoogleFonts.dmSans(fontSize: 12, color: Colors.black45),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 40,
        lineBarsData: [
          // Blue line - Average orders
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
            color: Colors.blue.shade700,
            barWidth: 3,
            dotData: FlDotData(show: false),
          ),
          // Green line - Transfers
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
            color: Colors.green.shade700,
            barWidth: 3,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
