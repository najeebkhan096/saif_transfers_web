import 'package:flutter/material.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';

import '../../../../model/user.dart';



class PasswordSection extends StatelessWidget {
  final UserModel user;
  final VoidCallback onEdit;

  const PasswordSection({
    super.key,
    required this.user,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: appTheme.formBackgroundColor),
      ),
      padding: EdgeInsets.all(12),
      child: Container(
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
                  Text("Password", style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  const SizedBox(height: 2),
                  Text(user.password, style: const TextStyle(fontSize: 14, color: Colors.black)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit, size: 18),
              onPressed: onEdit,
            ),
          ],
        ),
      ),
    );
  }
}
