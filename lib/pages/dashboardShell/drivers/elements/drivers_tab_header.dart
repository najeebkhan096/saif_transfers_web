import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theme/theme_helper.dart';
import 'drivers_tab_config.dart';

class DriversTableHeader extends StatelessWidget {
  const DriversTableHeader({super.key});

  Widget _buildHeaderCell(
      String text,
      double width, {
        TextAlign align = TextAlign.left,
      }) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: align,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final headerPadding = const EdgeInsets.symmetric(vertical: 0, horizontal: 0);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: appTheme.colorF7F8FA,
        border: Border.all(color: appTheme.colorEFF0F4),
      ),
      alignment: Alignment.centerLeft,
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: DriversTableConfig.checkbox),
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell("First Name", DriversTableConfig.firstName),
            ),
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell("Last Name", DriversTableConfig.lastName),
            ),
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell("Birthdate", DriversTableConfig.birthDate),
            ),
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell("State", DriversTableConfig.state),
            ),
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell("Home Location", DriversTableConfig.homeLocation),
            ),
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell("Work Location", DriversTableConfig.workLocation),
            ),
          ],
        ),
      ),
    );
  }
}
