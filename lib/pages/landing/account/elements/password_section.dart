import 'package:flutter/material.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';

import '../../../../model/user.dart';



class PasswordSection extends StatelessWidget {
  final UserModel user;
  final ValueChanged<UserModel> onUpdate;

  const PasswordSection({
    super.key,
    required this.user,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: appTheme.formBackgroundColor),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              color: appTheme.formBackgroundColor
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(user.password, style: const TextStyle(fontSize: 14)),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18),
                  onPressed: () {
                    // TODO: Implement password change modal
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
