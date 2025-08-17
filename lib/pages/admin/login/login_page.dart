import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/routes.dart';
import 'package:saif_transfers_web/core/styling.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8FAFC),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 900;

          return Padding(
            padding: appPaddingHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Panel (Form)
                Expanded(
                  flex: isMobile ? 1 : 1,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 24 : 40,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        // Logo
                        CustomImageView(
                          imagePath: ImageConstants.logo,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 40),

                        // Welcome
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            children: const [
                              TextSpan(text: "Login to "),
                              TextSpan(
                                text: "Admin Panel",
                                style: TextStyle(
                                  color: Color(0xffb58a00),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Description
                        Text(
                          "You'll be able to easily book and manage rides, and get ride status updates on the day of travel.",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: appTheme.greyCustom,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Email
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            hintStyle: GoogleFonts.poppins(fontSize: 14,color: appTheme.greyCustom),
                            border: const UnderlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Password
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            hintStyle: GoogleFonts.poppins(fontSize: 14,color: appTheme.greyCustom),
                            border: const UnderlineInputBorder(),
                            suffixIcon:  Icon(
                              Icons.visibility_off,
                              size: 18,
                              color: appTheme.greyCustom,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Forgot password
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot your password?",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: const Color(0xffb58a00),
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Login Button
                        CustomButton(
                          text: 'Login',
                          borderRadius: 10,
                          height: 50,
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.dashboard);
                          },
                        ),
                        const SizedBox(height: 30),

                        // Divider
                        _buildDividerWithText("OR"),
                        const SizedBox(height: 30),

                        // Google Button
                        _buildGoogleButton(context),

                        const SizedBox(height: 30),
                        FakeCaptcha(),
                      ],
                    ),
                  ),
                ),
                // Right Panel (Illustration)
                if (!isMobile)
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage(ImageConstants.authBanner),fit: BoxFit.cover),

                      ),

                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
  static Widget _buildDividerWithText(String text) {
    return Row(
      children: [
        Expanded(child: Divider(color: appTheme.greyCustom)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(text, style: GoogleFonts.poppins(fontSize: 12,color: appTheme.greyCustom)),
        ),
        Expanded(child: Divider(color: appTheme.greyCustom)),
      ],
    );
  }

  static Widget _buildGoogleButton(context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: appTheme.greyCustom,width: 0.15)
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.dashboard);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(imagePath: ImageConstants.google),
            const SizedBox(width: 8),
            Text(
              "Login with Google",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

}
class FakeCaptcha extends StatefulWidget {
  const FakeCaptcha({super.key});

  @override
  State<FakeCaptcha> createState() => _FakeCaptchaState();
}

class _FakeCaptchaState extends State<FakeCaptcha> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xffF3F3F3)
          ),
          child: Row(
            children: [
              CustomImageView(
                imagePath: ImageConstants.captcha,
                width: 40,
              ),
              SizedBox(width: 10,),

              Transform.scale(
                scale: 1.4, // increase size (1.0 = default)
                child: Checkbox(
                  value: isChecked,
                  onChanged: (val) {
                    setState(() {
                      isChecked = val ?? false;
                    });
                  },
                  checkColor: Colors.white, // color of the tick
                  fillColor: WidgetStateProperty.resolveWith<Color>(
                        (states) {
                      if (states.contains(WidgetState.selected)) {
                        return const Color(0xff4285F4); // Google blue when checked
                      }
                      return Colors.white; // background when unchecked
                    },
                  ),
                  side: const BorderSide(
                    color: Colors.white, // visible border
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), // square-like look
                  ),
                ),
              )
              ,

              const SizedBox(width: 8),
              const Text(
                "I'm not a robot",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
