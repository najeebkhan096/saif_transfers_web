// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/pages/dashboardShell/dashboard_page.dart';
import 'package:saif_transfers_web/pages/dashboardShell/settings/settings_page.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import '../../core/utils/images.dart';
import 'bookings/booking_page.dart';
import 'cleints/client_page.dart';
import 'drivers/drivers_page.dart';

class DashboardShell extends StatefulWidget {
  const DashboardShell({super.key});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  int _selectedIndex = 0;

  final List<String> menuItems = [
    "Dashboard",
    "Bookings & Transfers",
    "Clients",
    "Drivers",
    "Settings",
  ];

  final List<String> menuIcons = [
    ImageConstants.dashboard,
    ImageConstants.bookings,
    ImageConstants.clients,
    ImageConstants.drivers,
    ImageConstants.settings,
  ];

  final List<Widget> pages = [
    DashboardPage(),
    const BookingsPage(),
    const ClientsPage(),
    const DriversPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        return Scaffold(
          drawer: isMobile
              ? Drawer(
                  child: Sidebar(
                    menuItems: menuItems,
                    menuIcons: menuIcons,
                    selectedIndex: _selectedIndex,
                    onItemSelected: (index) {
                      setState(() => _selectedIndex = index);
                      Navigator.pop(context);
                    },
                  ),
                )
              : null,
          body: Row(
            children: [
              if (!isMobile)
                Sidebar(
                  menuItems: menuItems,
                  menuIcons: menuIcons,
                  selectedIndex: _selectedIndex,
                  onItemSelected: (index) {
                    setState(() => _selectedIndex = index);
                  },
                ),
              Expanded(
                child: Column(
                  children: [
                    Builder(
                      builder: (innerContext) => TopBar(
                        userName: "Muneeza",
                        showMenuButton: isMobile,
                        onMenuPressed: () =>
                            Scaffold.of(innerContext).openDrawer(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey.shade100,
                        child: SingleChildScrollView(
                          child: pages[_selectedIndex],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Sidebar Widget
class Sidebar extends StatelessWidget {
  final List<String> menuItems;
  final List<String> menuIcons;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const Sidebar({
    super.key,
    required this.menuItems,
    required this.menuIcons,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://corsproxy.io/?https://www.gulfgoodnews.com/uploads/images/2025/08/image_750x_689824c9a295d.jpg',
              ),
            ),
            title: const Text(
              "Muneeza",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("+998 (99) 436-46-15"),
          ),
          const SizedBox(height: 20),
          ...List.generate(menuItems.length, (index) {
            return SidebarItem(
              title: menuItems[index],
              iconPath: menuIcons[index],
              isSelected: selectedIndex == index,
              onTap: () => onItemSelected(index),
            );
          }),
        ],
      ),
    );
  }
}

/// Sidebar Menu Item
class SidebarItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xffcda316), Color(0xffb58a00)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 22,
              height: 22,
              color: isSelected ? appTheme.whiteCustom : appTheme.black,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.dmSans(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? appTheme.whiteCustom : appTheme.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Top Bar
class TopBar extends StatelessWidget {
  final String userName;
  final bool showMenuButton;
  final VoidCallback? onMenuPressed;

  const TopBar({
    super.key,
    required this.userName,
    this.showMenuButton = false,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          if (showMenuButton)
            IconButton(icon: const Icon(Icons.menu), onPressed: onMenuPressed),
          if (!showMenuButton)
            const Icon(Icons.menu, color: Colors.transparent),
          const SizedBox(width: 10),
          Text(
            "Good morning, $userName 👋",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
