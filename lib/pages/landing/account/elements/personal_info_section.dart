import 'package:flutter/material.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';

import '../../../../model/user.dart';



class PersonalInfoSection extends StatelessWidget {
  final UserModel user;
  final ValueChanged<UserModel> onUpdate;

  const PersonalInfoSection({
    super.key,
    required this.user,
    required this.onUpdate,
  });

  Widget _infoTile(String label, String value, VoidCallback onEdit) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: appTheme.formBackgroundColor,
        borderRadius: BorderRadius.circular(8),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 14, color: Colors.black)),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Personal Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              border: Border.all(color: appTheme.formBackgroundColor),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoTile("Name", user.name, () {}),
              const SizedBox(height: 8),
              _infoTile("Email", user.email, () {}),
              const SizedBox(height: 8),
              _infoTile("Phone", user.phone, () {}),
              const SizedBox(height: 8),
              _infoTile("Company", user.company, () {}),
              const SizedBox(height: 8),
              _infoTile("Address", user.address, () {}),
            ],
          ),
        ),
      ],
    );
  }
}
