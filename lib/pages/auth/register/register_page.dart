import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/theme/theme_helper.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';
import '../../../core/styling.dart';
import '../../../routes/app_paths.dart';
import '../../../services/user_service.dart';
import '../../../model/user.dart';
import '../../../enum/user_type.dart';
import '../../admin/login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = false;
  bool _obscureConfirmPassword = false;

  final UserService _userService = UserService();

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordCtrl.text != _confirmPasswordCtrl.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final user = await _userService.signUp(
        name: _nameCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text.trim(),
        type: AppUserType.admin, // default
      );

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("✅ Registration successful! Redirecting..."),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacementNamed(context, AppPaths.dashboard);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("❌ ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _registerWithGoogle() async {
    setState(() => _isLoading = true);

    try {
      final userCred = await _userService.signInWithGoogle();
      if (userCred != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("✅ Signed in with Google!"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacementNamed(context, AppPaths.dashboard);
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("❌ Google sign-in failed: $e")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
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
                              CustomImageView(
                                imagePath: ImageConstants.logo,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 40),

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
                                        color: const Color(0xffb58a00),
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

                              Text(
                                "Sign up to enjoy a seamless booking experience.",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0xff9B9B9B),
                                ),
                              ),
                              SizedBox(height: 30.h),

                              _buildFormField(_nameCtrl, "Full Name"),
                              SizedBox(height: 20.h),

                              _buildFormField(
                                _emailCtrl,
                                "Email",
                                keyboard: TextInputType.emailAddress,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return "Email is required";
                                  }
                                  if (!v.contains("@")) {
                                    return "Enter a valid email";
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 20.h),

                              _buildFormField(
                                _passwordCtrl,
                                "Password",
                                obscure: _obscurePassword,
                                validator: (v) {
                                  if (v == null || v.length < 6) {
                                    return "Password must be at least 6 characters";
                                  }
                                  return null;
                                },
                                suffix: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 20.h),

                              _buildFormField(
                                _confirmPasswordCtrl,
                                "Confirm Password",
                                obscure: _obscureConfirmPassword,
                                suffix: IconButton(
                                  icon: Icon(
                                    _obscureConfirmPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureConfirmPassword =
                                          !_obscureConfirmPassword;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 30.h),

                              CustomButton(
                                margin: EdgeInsets.all(0),
                                text: 'Register',
                                borderRadius: 10,
                                height: 50,
                                onPressed: _isLoading ? null : _register,
                              ),
                              SizedBox(height: 30.h),

                              _buildDividerWithText("OR"),
                              SizedBox(height: 30.h),

                              _buildGoogleButton(),
                              SizedBox(height: 30.h),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: appTheme.greyCustom,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  InkWell(
                                    onTap: () {
                                      context.go(AppPaths.login);
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
                    ),
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
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(color: Color(0xffb58a00)),
              ),
            ),
        ],
      ),
    );
  }

  // 🔹 Updated reusable field builder with suffix support
  Widget _buildFormField(
    TextEditingController ctrl,
    String hint, {
    bool obscure = false,
    TextInputType keyboard = TextInputType.text,
    String? Function(String?)? validator,
    Widget? suffix,
  }) {
    return TextFormField(
      controller: ctrl,
      obscureText: obscure,
      validator:
          validator ??
          (v) {
            if (v == null || v.isEmpty) return "$hint is required";
            return null;
          },
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          fontSize: 14,
          color: const Color(0xff9B9B9B),
        ),
        border: const UnderlineInputBorder(),
        suffixIcon: suffix, // 👈 Eye icon here
      ),
    );
  }

  Widget _buildDividerWithText(String text) {
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

  Widget _buildGoogleButton() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(color: appTheme.greyCustom, width: 0.15),
      ),
      child: InkWell(
        onTap: _isLoading ? null : _registerWithGoogle,
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
