import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saif_transfers_web/pages/auth/login/login_page.dart';
import 'package:saif_transfers_web/pages/auth/register/register_page.dart';
import 'package:saif_transfers_web/pages/checkout/checkout_page.dart';
import 'package:saif_transfers_web/providers/stepper_provider.dart';

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
      ],
      child: MaterialApp(
        title: 'Luxury Airport Travel',
        debugShowCheckedModeBanner: false,
        home: RegisterPage(),
      ),
    );
  }
}
