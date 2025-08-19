import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

import '../../../core/routes.dart';
import '../../../core/styling.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 900;

          return Padding(
            padding: appPaddingHorizontal,
            child: Row(
              children: [
                // Left Panel (Form)
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 24.h : 40.h,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(height: 30.h),
                        CustomImageView(
                          imagePath: ImageConstants.logo,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 40),

                        // Welcome text
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "Create ",
                                style: TextStyle(
                                  color: Color(0xffb58a00),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "your Account",
                                style: TextStyle(
                                  color: appTheme.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                         SizedBox(height: 10.h),

                        // Description
                        Text(
                          "Sign up to enjoy a seamless booking experience.",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xff9B9B9B),
                          ),
                        ),
                        SizedBox(height: 30.h),


                        // Email
                        _buildTextField("Enter your email"),
                        SizedBox(height: 20.h),

                        // Password
                        _buildTextField(
                          "Enter your password",
                          obscure: true,
                          suffixIcon: Icons.visibility_off,
                        ),
                        SizedBox(height: 20.h),

                        // Confirm Password
                        _buildTextField(
                          "Confirm your password",
                          obscure: true,
                          suffixIcon: Icons.visibility_off,
                        ),
                        SizedBox(height: 20.h),

                        // Register Button
                        CustomButton(
                          margin: EdgeInsets.all(0),
                          text: 'Register',
                          borderRadius: 10,
                          height: 50,
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.dashboard);
                          },
                        ),
                        SizedBox(height: 30.h),

                        // Divider
                        _buildDividerWithText("OR"),
                        SizedBox(height: 30.h),

                        // Google Button
                        _buildGoogleButton(context),
                        SizedBox(height: 30.h),

                        // Already have an account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: GoogleFonts.poppins(fontSize: 12,color: appTheme.greyCustom),
                            ),
                            const SizedBox(width: 4),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.login);
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: const Color(0xffb58a00),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        FakeCaptcha(),
                      ],
                    ),
                  ),
                ),

                // Right Panel (Illustration)
                if (!isMobile)
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(ImageConstants.authBanner),
                          fit: BoxFit.cover,
                        ),
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

  static Widget _buildTextField(
    String hint, {
    bool obscure = false,
    IconData? suffixIcon,
  }) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(fontSize: 14, color: Color(0xff9B9B9B)),
        border: const UnderlineInputBorder(),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 18) : null,
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
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: appTheme.greyCustom,width: 0.15)
      ),
      padding: EdgeInsets.symmetric(vertical: 5),
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
    return Container(
      width: 350,
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
    );
  }
}
