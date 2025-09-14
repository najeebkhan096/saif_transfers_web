import 'package:flutter/material.dart';
import 'package:saif_transfers_web/pages/auth/login/login_page.dart';
import 'package:saif_transfers_web/pages/admin/login/login_page.dart';
import 'package:saif_transfers_web/pages/auth/register/register_page.dart';
import 'package:saif_transfers_web/pages/landing/landing_page.dart';

import '../pages/admin/dashboardShell/dashboard_shell.dart';


class AppRoutes {
  // Route names
  static const String landing = '/';
  static const String dashboard = '/dashboard';
  static const String login = '/login';
  static const String register = '/register';
  static const String adminLoginPage = '/adminLoginPage';

  // Route generator with animation
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landing:
        return _animatedRoute( LandingPage(), settings);
      case dashboard:
        return _animatedRoute(const DashboardShell(), settings);
      case login:
        return _animatedRoute(const LoginPage(), settings);
      case register:
        return _animatedRoute(const RegisterPage(), settings);
        case adminLoginPage:
        return _animatedRoute(const AdminLoginPage(), settings);
      default:
        return _errorRoute(settings.name);
    }
  }

  /// Slide from right animation
  static PageRouteBuilder _animatedRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // From right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static MaterialPageRoute _errorRoute(String? routeName) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            'No route defined for "$routeName"',
            style: const TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
