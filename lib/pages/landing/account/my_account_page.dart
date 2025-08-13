import 'package:flutter/material.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import '../../../model/user.dart';
import '../../../widgets/custom_button.dart';
import 'elements/notification_section.dart';
import 'elements/password_section.dart';
import 'elements/payment_section.dart';
import 'elements/personal_info_section.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  UserModel user = UserModel(
    name: "Ahmed Hussain Mujtaba",
    email: "ahmedh@example.com",
    phone: "+923407657765",
    company: "+923407657765",
    address: "+923407657765",
    password: "**********",
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Center(
        child: SizedBox(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "My Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Manage your information so that Company Name meets your needs.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              PersonalInfoSection(
                user: user,
                onUpdate: (updated) {
                  setState(() => user = updated);
                },
              ),
              const SizedBox(height: 20),
              PasswordSection(
                user: user,
                onUpdate: (updated) {
                  setState(() => user = updated);
                },
              ),
              const SizedBox(height: 20),
              PaymentSection(),
              const SizedBox(height: 20),
              NotificationsSection(
                user: user,
                onUpdate: (updated) {
                  setState(() => user = updated);
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Delete account',
                borderRadius: 10,
                height: 50,
                backgroundColor: appTheme.whiteCustom,
                borderColor: appTheme.black,
                textColor: appTheme.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
