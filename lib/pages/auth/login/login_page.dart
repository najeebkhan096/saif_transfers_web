import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/styling.dart';
import '../../../core/utils/images.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../routes/app_paths.dart';
import '../../../providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  void _showMessage(String text, {Color color = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      // Debug prints
      print(
        '🔹 Login complete. isLoggedIn=${userProvider.isLoggedIn}, userType=${userProvider.userType}',
      );

      if (userProvider.isLoggedIn) {
        _showMessage("✅ Login successful!", color: Colors.green);

        // GoRouter redirect will also trigger automatically via refreshListenable
      }
    } catch (e) {
      _showMessage("❌ ${e.toString()}");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loginWithGoogle() async {
    setState(() => _isLoading = true);

    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      // await userProvider.signInWithGoogle();

      print(
        '🔹 Google login complete. isLoggedIn=${userProvider.isLoggedIn}, userType=${userProvider.userType}',
      );

      if (userProvider.isLoggedIn) {
        _showMessage("✅ Google login successful!", color: Colors.green);
      }
    } catch (e) {
      _showMessage("❌ Google login failed: ${e.toString()}");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 900;

          return Padding(
            padding: appPaddingHorizontal,
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 24.h : 40.h,
                      vertical: 20,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),

                          /// Logo
                          CustomImageView(
                            imagePath: ImageConstants.logo,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 40.h),

                          /// Welcome
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              children: const [
                                TextSpan(text: "Welcome to "),
                                TextSpan(
                                  text: "Company Name",
                                  style: TextStyle(
                                    color: Color(0xffb58a00),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),

                          Text(
                            "Login to manage your rides and bookings.",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: appTheme.greyCustom,
                            ),
                          ),
                          SizedBox(height: 30.h),

                          /// Email
                          TextFormField(
                            controller: _emailController,
                            validator: (v) {
                              if (v == null || v.isEmpty)
                                return "Email is required";
                              final emailRegex = RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              );
                              if (!emailRegex.hasMatch(v))
                                return "Enter a valid email";
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter your email",
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                color: appTheme.greyCustom,
                              ),
                              border: const UnderlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20.h),

                          /// Password
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            validator: (v) {
                              if (v == null || v.isEmpty)
                                return "Password is required";
                              if (v.length < 6)
                                return "Password must be at least 6 characters";
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                color: appTheme.greyCustom,
                              ),
                              border: const UnderlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 18,
                                  color: appTheme.greyCustom,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot your password?",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: const Color(0xffb58a00),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),

                          /// Login Button
                          CustomButton(
                            text: _isLoading ? 'Loading...' : 'Login',
                            borderRadius: 10,
                            height: 50,
                            onPressed: _isLoading ? null : _login,
                          ),
                          SizedBox(height: 30.h),

                          _buildDividerWithText("OR"),
                          SizedBox(height: 30.h),

                          /// Google Button
                          GestureDetector(
                            onTap: _isLoading ? null : _loginWithGoogle,
                            child: _buildGoogleButton(),
                          ),
                          SizedBox(height: 30.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account yet?",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: appTheme.greyCustom,
                                ),
                              ),
                              const SizedBox(width: 4),
                              InkWell(
                                onTap: () {
                                  context.go(AppPaths.register);
                                },
                                child: Text(
                                  "Sign Up",
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
                ),
                if (!isMobile)
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
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

  static Widget _buildDividerWithText(String text) {
    return Row(
      children: [
        Expanded(child: Divider(color: appTheme.greyCustom)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: appTheme.greyCustom,
            ),
          ),
        ),
        Expanded(child: Divider(color: appTheme.greyCustom)),
      ],
    );
  }

  static Widget _buildGoogleButton() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(color: appTheme.greyCustom, width: 0.15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(imagePath: ImageConstants.google),
          const SizedBox(width: 8),
          Text("Login with Google", style: GoogleFonts.poppins(fontSize: 14)),
        ],
      ),
    );
  }
}
