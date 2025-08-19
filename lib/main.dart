import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:saif_transfers_web/providers/navigation.dart';
import 'package:saif_transfers_web/providers/stepper_provider.dart';
import 'core/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAkNO8jRPKT8OL_2d1BuZdl_yXnuVn8-3E",
      authDomain: "airporttransfer-2d9c0.firebaseapp.com",
      projectId: "airporttransfer-2d9c0",
      storageBucket: "airporttransfer-2d9c0.firebasestorage.app",
      messagingSenderId: "1068138876918",
      appId: "1:1068138876918:web:e45cc4f687538319bdc1d7",
      measurementId: "G-PKLTFXZYHT", // Optional
    ),
  );
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
      child: ScreenUtilInit(
        designSize: const Size(1440, 1024), // reference design size
        minTextAdapt: true, // adapts text automatically
        splitScreenMode: true, // handles split screen
        builder: (context, child) {
          return MaterialApp(
            title: 'Saif Transfers',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.landing,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        },
      ),
    );
  }
}
