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
      margin: const EdgeInsets.symmetric(vertical: 12),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: DriversTableConfig.checkbox,
              child: Checkbox(
                value: false,
                onChanged: (value) {},
                activeColor: const Color(0xffcda316),
              ),
            ),
            _buildHeaderCell("First Name", DriversTableConfig.firstName),
            _buildHeaderCell("Last Name", DriversTableConfig.lastName),
            _buildHeaderCell("Birthdate", DriversTableConfig.birthDate),
            _buildHeaderCell("State", DriversTableConfig.state),
            _buildHeaderCell("Home Location", DriversTableConfig.homeLocation),
            _buildHeaderCell("Work Location", DriversTableConfig.workLocation),
          ],
        ),
      ),
    );
  }
}
