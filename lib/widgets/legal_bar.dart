import 'package:flutter/material.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';

class LegalBar extends StatelessWidget {
  const LegalBar({super.key});

  @override
  Widget build(BuildContext context) {
    const maxW = 1180.0;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE9E9E9))),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxW),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isSmallScreen = constraints.maxWidth < 600;

              if (isSmallScreen) {
                // Stack vertically for small screens
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
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(width: 20),
                        ..._links.map((link) => _DotSeparatedText(text: link)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const LanguageSelector(),
                  ],
                );
              }

              // Row for larger screens
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    spacing: 0,
                    runSpacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstants.logo,
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(width: 20),
                      ..._links.map((link) => _DotSeparatedText(text: link)),
                    ],
                  ),
                  const LanguageSelector(),
                ],
              );
            },
          ),
        ),
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
