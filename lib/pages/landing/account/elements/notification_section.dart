import 'package:flutter/material.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';

import '../../../../model/user.dart';



class NotificationsSection extends StatelessWidget {
  final UserModel user;
  final ValueChanged<UserModel> onUpdate;

  const NotificationsSection({
    super.key,
    required this.user,
    required this.onUpdate,
  });

  Widget _notificationTile(String label, String value, VoidCallback onEdit) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, size: 18),
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String bookingValue = '';
    if (user.bookingEmail && user.bookingSMS) {
      bookingValue = 'On: Email and SMS';
    } else if (user.bookingEmail) {
      bookingValue = 'On: Email';
    } else if (user.bookingSMS) {
      bookingValue = 'On: SMS';
    } else {
      bookingValue = 'Off';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Notifications", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
         border: Border.all(color: appTheme.formBackgroundColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              _notificationTile(
                "Marketing emails",
                user.marketingEmails ? "On" : "Off",
                    () {
                  // TODO: Open notification settings
                },
              ),
              _notificationTile(
                "Booking notifications",
                bookingValue,
                    () {
                  // TODO: Open booking notifications settings
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
