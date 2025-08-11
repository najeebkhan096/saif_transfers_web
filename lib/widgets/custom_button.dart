import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/theme_helper.dart';
import 'custom_image_view.dart';

/// CustomButton - A flexible button component that supports both icon and text styles
///
/// By default, it's a text button unless `iconPath` is provided.
///
/// All styling (text style, colors, sizes, borders, gradients) can be customized.
///
/// If `iconPath` is given, button behaves as an icon button.
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.iconPath,
    this.width,
    this.height,
    this.backgroundColor,
    this.gradient,
    this.borderColor,
    this.textColor,
    this.fontSize,
    this.borderRadius,
    this.fontWeight,
    this.isEnabled,
    this.margin,
  });

  final VoidCallback? onPressed;
  final String? text;
  final String? iconPath;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final bool? isEnabled;
  final EdgeInsets? margin;

  bool get _isIconVariant => iconPath != null && iconPath!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final bool enabled = isEnabled ?? true;

    return Padding(
      padding: margin ?? EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: width,
        height: height,
        child: Material(
          color: appTheme.transparentCustom,
          child: InkWell(
            onTap: enabled ? onPressed : null,
            borderRadius: BorderRadius.circular(borderRadius?? 8),
            child: AnimatedScale(
              scale: enabled ? 1.0 : 0.95,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: gradient == null
                      ? (backgroundColor ?? _getDefaultBackgroundColor())
                      : null,
                  gradient: gradient,
                  border: _getBorder(),
                  borderRadius: BorderRadius.circular(borderRadius?? 8),
                ),
                padding: EdgeInsets.all(
                  _isIconVariant ? 12 : 0,
                ),
                child: Center(child: _buildContent()),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_isIconVariant) {
      return CustomImageView(
        imagePath: iconPath!,
        height: 24,
        width: 24,
      );
    } else {
      return  Text(
        text ?? '',
        style: GoogleFonts.dmSans().copyWith(
          color: textColor ?? appTheme.whiteCustom,
          fontSize: (fontSize ),
          fontWeight: fontWeight,
        ),
      );

    }
  }

  Color _getDefaultBackgroundColor() {
    if (_isIconVariant) {
      return appTheme.transparentCustom;
    }
    return appTheme.blueCustom;
  }

  Border? _getBorder() {
    return Border.all(color: borderColor ?? appTheme.colorFFD0D0, width: 0.5);
  }
}
