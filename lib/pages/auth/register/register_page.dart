import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

import '../../../core/routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 900;

          return Row(
            children: [
              // Left Panel (Form)
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 40,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      CustomImageView(
                        imagePath: ImageConstants.logo,
                        width: 100,
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
                          children: const [
                            TextSpan(text: "Create your "),
                            TextSpan(
                              text: "Account",
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
                        "Sign up to book and manage rides, and get real-time updates on your travel.",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Name
                      _buildTextField("Enter your full name"),
                      const SizedBox(height: 20),

                      // Email
                      _buildTextField("Enter your email"),
                      const SizedBox(height: 20),

                      // Password
                      _buildTextField(
                        "Enter your password",
                        obscure: true,
                        suffixIcon: Icons.visibility_off,
                      ),
                      const SizedBox(height: 20),

                      // Confirm Password
                      _buildTextField(
                        "Confirm your password",
                        obscure: true,
                        suffixIcon: Icons.visibility_off,
                      ),
                      const SizedBox(height: 30),

                      // Register Button
                       CustomButton(
                        text: 'Register',
                        borderRadius: 10,
                        height: 50,
                        onPressed: (){
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

                      // Already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                          const SizedBox(width: 4),
                          InkWell(
                            onTap: (){
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
                    ],
                  ),
                ),
              ),

              // Right Panel (Illustration)
              if (!isMobile)
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffcda316), Color(0xffb58a00)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstants.authBanner,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  static Widget _buildTextField(String hint,
      {bool obscure = false, IconData? suffixIcon}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(fontSize: 14),
        border: const UnderlineInputBorder(),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 18) : null,
      ),
    );
  }

  static Widget _buildDividerWithText(String text) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[400])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(text, style: GoogleFonts.poppins(fontSize: 12)),
        ),
        Expanded(child: Divider(color: Colors.grey[400])),
      ],
    );
  }

  static Widget _buildGoogleButton(context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[300]!),
        color: Colors.white,
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
              "Register with Google",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
