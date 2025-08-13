import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saif_transfers_web/pages/landing/landing_page.dart';
import 'package:saif_transfers_web/providers/navigation.dart';
import 'package:saif_transfers_web/providers/stepper_provider.dart';
import 'core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CheckoutStepperProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MaterialApp(
        title: 'Saif Transfers',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.landing,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
