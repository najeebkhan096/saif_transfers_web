import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saif_transfers_web/core/styling.dart';
import 'package:saif_transfers_web/pages/bookRide/book_ride_page.dart';
import 'package:saif_transfers_web/pages/landing/contact/contact_page.dart';
import 'package:saif_transfers_web/pages/landing/home/home_page.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import '../../core/utils/images.dart';
import '../../providers/navigation.dart';
import 'account/my_account_page.dart';
import 'home/elements/header_section.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final List<Widget> pages = const [
    HomePage(),
    BookRidePage(),
    MyAccountPage(),
    ContactPage(),
  ];

  final List<String> menuTitles = [
    'Home',
    'Book a Ride',
    'My Account',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = context.watch<NavigationProvider>();

    // Find the current page index
    int currentIndex = menuTitles.indexOf(navigationProvider.activeItem);
    if (currentIndex == -1) currentIndex = 0;

    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Image.asset(ImageConstants.logo)),
            for (var title in menuTitles)
              ListTile(
                title: Text(title),
                selected: navigationProvider.activeItem == title,
                selectedColor: Colors.blue,
                onTap: () {
                  navigationProvider.setActiveItem(title);
                  Navigator.of(context).pop(); // close drawer
                },
              ),
          ],
        ),
      ),
      body: Padding(
        padding: appPaddingHorizontal,
        child: Column(
          children: [
            const LandingHeaderSection(),
            Expanded(child: pages[currentIndex]),
          ],
        ),
      ),
    );
  }
}
