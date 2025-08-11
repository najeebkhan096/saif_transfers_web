import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theme/theme_helper.dart';
import 'clients_tab_configs.dart';

class ClientsTableHeader extends StatelessWidget {
  const ClientsTableHeader({super.key});

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
    final headerPadding = const EdgeInsets.symmetric(
      vertical: 0,
      horizontal: 0,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: appTheme.colorF7F8FA,
        border: Border.all(color: appTheme.colorEFF0F4),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: ClientTableConfig.checkbox), // Checkbox placeholder
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell("User", ClientTableConfig.customer),
            ),
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell(
                "Total Rides",
                ClientTableConfig.totalRides,
                align: TextAlign.start,
              ),
            ),
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell(
                "Total Finished",
                ClientTableConfig.totalFinished,
                align: TextAlign.start,
              ),
            ),
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell(
                "Home Location",
                ClientTableConfig.homeLocation,
                align: TextAlign.start,
              ),
            ),
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell(
                "Work Location",
                ClientTableConfig.workLocation,
                align: TextAlign.start,
              ),
            ),
            Padding(
              padding: headerPadding,
              child: _buildHeaderCell(
                "Actions",
                ClientTableConfig.actions,
                align: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
