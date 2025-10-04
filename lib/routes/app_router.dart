import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../enum/user_type.dart';
import 'app_paths.dart';
import '../providers/user_provider.dart';
import '../pages/landing/landing_page.dart';
import '../pages/auth/login/login_page.dart';
import '../pages/auth/register/register_page.dart';
import '../pages/admin/login/login_page.dart';
import '../pages/admin/dashboardShell/dashboard_shell.dart';

class AppRouter {
  static GoRouter router(UserProvider userProvider) {
    return GoRouter(
      initialLocation: AppPaths.landing,
      refreshListenable: userProvider,
      debugLogDiagnostics: true, // ✅ enables GoRouter debug logs
      routes: [
        GoRoute(
          path: AppPaths.landing,
          builder: (context, state) {
            debugPrint("🔹 Navigating to LandingPage");
            return LandingPage();
          },
        ),
        GoRoute(
          path: AppPaths.login,
          builder: (context, state) {
            debugPrint("🔹 Navigating to LoginPage");
            return const LoginPage();
          },
        ),
        GoRoute(
          path: AppPaths.register,
          builder: (context, state) {
            debugPrint("🔹 Navigating to RegisterPage");
            return const RegisterPage();
          },
        ),
        GoRoute(
          path: AppPaths.adminLogin,
          builder: (context, state) {
            debugPrint("🔹 Navigating to AdminLoginPage");
            return const AdminLoginPage();
          },
        ),
        GoRoute(
          path: AppPaths.dashboard,
          builder: (context, state) {
            debugPrint("🔹 Navigating to DashboardShell");
            return const DashboardShell();
          },
        ),
      ],
      redirect: (context, state) {
        final userProvider = Provider.of<UserProvider>(context, listen: false);

        final bool isLoggedIn = userProvider.firebaseUser != null;
        final bool isAdmin = userProvider.userType == AppUserType.admin;
        final AppUserType type = userProvider.userType;
        final String currentLocation = state.uri.toString();

        debugPrint("🛠 [GoRouter Redirect]");
        debugPrint("Current location: $currentLocation");
        debugPrint(
          "isLoggedIn: $isLoggedIn, isAdmin: $isAdmin, userType: $type",
        );

        // Admin logged in → dashboard
        if (isAdmin && currentLocation != AppPaths.dashboard) {
          debugPrint("Redirecting admin to dashboard");
          return AppPaths.dashboard;
        }

        // Rider redirect
        if (isLoggedIn &&
            type == AppUserType.rider &&
            currentLocation != AppPaths.riderDashboard) {
          debugPrint("Redirecting rider to riderDashboard");
          return AppPaths.riderDashboard;
        }

        // Driver redirect
        if (isLoggedIn &&
            type == AppUserType.driver &&
            currentLocation != AppPaths.driverDashboard) {
          debugPrint("Redirecting driver to driverDashboard");
          return AppPaths.driverDashboard;
        }

        // Not logged in → allow only auth pages
        if (!isLoggedIn &&
            currentLocation != AppPaths.login &&
            currentLocation != AppPaths.register &&
            currentLocation != AppPaths.adminLogin) {
          debugPrint("User not logged in → redirect to login");
          return AppPaths.login;
        }

        debugPrint("No redirect required");
        return null; // no redirect
      },
    );
  }
}
