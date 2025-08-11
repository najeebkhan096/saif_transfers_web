// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';
import '../../../core/responsive.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 12 : 18,
        horizontal: isMobile ? 16 : 40,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          Image.asset(ImageConstants.logo, height: isMobile ? 32 : 42),
          SizedBox(width: isMobile ? 12 : 32),

          // Navigation (hidden on mobile)
          if (!isMobile) ...[
            const _NavItem(title: 'Home'),
            const _NavItem(title: 'Book a Ride'),
            const _NavItem(title: 'My Account'),
            const _NavItem(title: 'Contact'),
          ],

          const Spacer(),

          // Actions (desktop/tablet)
          if (!isMobile)
            Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey.shade700,
                  size: isTablet ? 18 : 22,
                ),
                SizedBox(width: isTablet ? 4 : 8),
                Icon(
                  Icons.phone,
                  color: Colors.grey.shade700,
                  size: isTablet ? 18 : 22,
                ),
                SizedBox(width: isTablet ? 4 : 8),
                Text(
                  "+1800 000 122",
                  style: GoogleFonts.inter(
                    fontSize: isTablet ? 12 : 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(width: isTablet ? 12 : 24),
                CustomButton(
                  width: isTablet ? 60 : 80,
                  margin: EdgeInsets.all(0),
                  height: 36,
                  borderRadius: 5,
                  borderColor: appTheme.coloF6F6F6,
                  backgroundColor: appTheme.coloF6F6F6,
                  text: 'Login',
                  textColor: appTheme.black,
                  fontWeight: FontWeight.bold,
                  fontSize: isTablet ? 12 : 14,
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                CustomButton(
                  margin: EdgeInsets.all(0),
                  width: isTablet ? 60 : 90,
                  height: 36,
                  borderRadius: 5,
                  fontSize: isTablet ? 12 : 14,
                  borderColor: appTheme.black,
                  backgroundColor: appTheme.black,
                  text: 'Sign Up',
                  textColor: Colors.white,
                  fontWeight: FontWeight.w600,
                  onPressed: () {},
                ),
              ],
            ),

          // Mobile Menu
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu, size: 26, color: Colors.black87),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  const _NavItem({required this.title});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = Responsive.isTablet(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 10 : 16),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(4),
        hoverColor: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: isTablet ? 12 : 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
