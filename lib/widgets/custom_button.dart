import 'package:dotted_border/dotted_border.dart';
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
  final EdgeInsetsGeometry? margin;

  bool get _isIconVariant => iconPath?.isNotEmpty ?? false;

  @override
  Widget build(BuildContext context) {
    final enabled = isEnabled ?? true;

    return Padding(
      padding: margin ?? EdgeInsets.all(0),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(imagePath: iconPath!, height: 12, width: 12),
            SizedBox(width: 10  ,),
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


class DottedCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;

  const DottedCustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.black,
    this.textColor = Colors.black,
    this.borderRadius = 10, // 👈 default 20
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(borderRadius),
        dashPattern: const [3, 2], // smaller dash, smaller gap
        color: color,
        strokeWidth: 0.5,
        padding: EdgeInsets.zero, // ensures no extra padding
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: padding,
          height: 52,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
