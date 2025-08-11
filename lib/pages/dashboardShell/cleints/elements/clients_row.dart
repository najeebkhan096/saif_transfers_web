import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';
import '../../../../model/client.dart';
import 'clients_tab_configs.dart';

class ClientRow extends StatelessWidget {
  final ClientModel client;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ClientRow({
    super.key,
    required this.client,
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
    final phoneStyle = GoogleFonts.dmSans(
      fontSize: 12,
      color: Colors.grey.shade600,
    );
    final cellTextStyle = GoogleFonts.dmSans(fontSize: 14);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 0.8),
        ),
      ),
      child: Row(
        children: [
          // Checkbox
          SizedBox(
            width: ClientTableConfig.checkbox,
            child: Column(
              children: [
                CustomImageView(imagePath: ImageConstants.message,width: 20,height: 20,),
              ],
            ),
          ),

          // Customer Info
          SizedBox(
            width: ClientTableConfig.customer,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(client.avatar),
                  radius: 18,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        client.name,
                        style: nameStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        client.phone,
                        style: phoneStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Ride Stats
          _buildCell(
            client.totalRides,
            ClientTableConfig.totalRides,
            style: cellTextStyle,
            alignment: Alignment.center,
          ),
          _buildCell(
            client.totalFinished,
            ClientTableConfig.totalFinished,
            style: cellTextStyle,
            alignment: Alignment.center,
          ),

          // Locations
          _buildCell(
            client.homeLocation,
            ClientTableConfig.homeLocation,
            style: cellTextStyle,
          ),
          _buildCell(
            client.workLocation,
            ClientTableConfig.workLocation,
            style: cellTextStyle,
          ),

          // Actions
          SizedBox(
            width: ClientTableConfig.actions,
            child: Row(
              children: [
                CustomImageView(imagePath: ImageConstants.edit),
                SizedBox(width: 15),
                CustomImageView(imagePath: ImageConstants.delete),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
