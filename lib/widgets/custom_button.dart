import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/theme_helper.dart';
import 'custom_image_view.dart';

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

  bool get _isIconVariant => iconPath?.isNotEmpty ?? false;

  @override
  Widget build(BuildContext context) {
    final enabled = isEnabled ?? true;

    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: width,
        height: height,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          child: AnimatedScale(
            scale: enabled ? 1.0 : 0.95,
            duration: const Duration(milliseconds: 200),
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                gradient: backgroundColor == null
                    ? (gradient ??
                          const LinearGradient(
                            colors: [Color(0xffEFBF04), Color(0xff896D02)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ))
                    : null,
                border: Border.all(
                  color: borderColor ?? appTheme.colorFFD0D0,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
              ),
              padding: EdgeInsets.all(_isIconVariant ? 12 : 0),
              child: Center(child: _buildContent()),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return _isIconVariant
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(imagePath: iconPath!, height: 24, width: 24),
            SizedBox(width: 20  ,),
            Text(
              text ?? '',
              style: GoogleFonts.dmSans(
                color: textColor ?? appTheme.whiteCustom,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            )
          ],
        )
        : Text(
            text ?? '',
            style: GoogleFonts.dmSans(
              color: textColor ?? appTheme.whiteCustom,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          );
  }
}
