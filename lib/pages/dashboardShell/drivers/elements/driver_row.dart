import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drivers_tab_config.dart';
import '../../../../model/driver.dart';

class DriverRow extends StatelessWidget {
  final DriverModel driver;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const DriverRow({
    super.key,
    required this.driver,
    required this.isSelected,
    required this.onSelected,
    required this.onEdit,
    required this.onDelete,
  });

  Widget _buildCell(
      String text,
      double width, {
        TextStyle? style,
        Alignment alignment = Alignment.centerLeft,
      }) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      alignment: alignment,
      child: Text(
        text.isNotEmpty ? text : "-",
        style: style,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameStyle = GoogleFonts.dmSans(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );
    final cellTextStyle = GoogleFonts.dmSans(fontSize: 14);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 0.8),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: DriversTableConfig.checkbox,
            child: Checkbox(
              value: isSelected,
              onChanged: (value) => onSelected(value ?? false),
            ),
          ),

          // First Name with avatar
          SizedBox(
            width: DriversTableConfig.firstName,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(driver.avatar),
                  radius: 18,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    driver.firstName,
                    style: nameStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          _buildCell(driver.lastName, DriversTableConfig.lastName, style: cellTextStyle),
          _buildCell(driver.birthDate, DriversTableConfig.birthDate, style: cellTextStyle,),
          _buildCell(driver.state, DriversTableConfig.state, style: cellTextStyle),
          _buildCell(driver.homeLocation, DriversTableConfig.homeLocation, style: cellTextStyle),
          _buildCell(driver.workLocation, DriversTableConfig.workLocation, style: cellTextStyle),

        ],
      ),
    );
  }
}
