import 'package:flutter/material.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

class LegalBar extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const LegalBar({super.key,this.margin,this.padding});

  @override
  Widget build(BuildContext context) {


    return Container(
     padding: padding,
      margin: margin,

      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE9E9E9))),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;

          if (isSmallScreen) {
            // ---------- MOBILE VIEW ----------
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 0,
                  runSpacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstants.logo,
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 12),
                    ..._links.map((link) => _DotSeparatedText(text: link)),
                  ],
                ),
                const SizedBox(height: 12),
                const LanguageSelector(),
              ],
            );
          }

          // ---------- DESKTOP / TABLET VIEW ----------
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstants.logo,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(width: 20),
                  Wrap(
                    spacing: 0,
                    runSpacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ..._links.map((link) => _DotSeparatedText(text: link)),
                    ],
                  ),
                ],
              ),
              const LanguageSelector(),
            ],
          );
        },
      ),
    );
  }
}

const _links = [
  'Terms',
  'Privacy policy',
  'Legal notice',
  'Accessibility',
];

class _DotSeparatedText extends StatelessWidget {
  final String text;
  const _DotSeparatedText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: Colors.black45,
            shape: BoxShape.circle,
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String _selectedLanguage = 'English';
  final Map<String, String> _languages = {
    'English': '🇬🇧',
    'French': '🇫🇷',
    'Arabic': '🇸🇦',
    'Urdu': '🇵🇰',
  };

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: _selectedLanguage,
        icon: const Icon(Icons.arrow_drop_down),
        style: const TextStyle(fontSize: 14, color: Colors.black87),
        onChanged: (newValue) {
          setState(() {
            _selectedLanguage = newValue!;
          });
        },
        items: _languages.entries.map((entry) {
          return DropdownMenuItem<String>(
            value: entry.key,
            child: Row(
              children: [
                Text(entry.value, style: const TextStyle(fontSize: 18)), // flag emoji
                const SizedBox(width: 8),
                Text(entry.key),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
