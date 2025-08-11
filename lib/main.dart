import 'package:flutter/material.dart';
import 'package:saif_transfers_web/pages/dashboardShell/dashboard_shell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luxury Airport Travel',
      debugShowCheckedModeBanner: false,
      home: DashboardShell(),
    );
  }
}
