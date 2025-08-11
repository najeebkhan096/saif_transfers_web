// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ========== CONSTANTS ==========
const Color kAccentGreen = Color(0xFF9BC400);
const Color kInputBorder = Color(0xFFCBDDEA);
const Color kBgColor = Color(0xFFF6F8FA);
const Color kCardBorder = Color(0xFFE8EEF3);
const Color kTextPrimary = Color(0xFF23323D);
const Color kTextSecondary = Color(0xFF3F5A66);
const Color kSubtitle = Color(0xFF6B7A82);

/// ========== MAIN PAGE ==========
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Current values
  String systemLanguage = 'English';
  String adminTheme = 'Light Theme';
  String defaultUserTheme = 'Light Theme';
  String timeZone = 'CET - Central European Time';
  String dateFormat = 'DD/MM/YYYY';
  String currency = 'USD (\$)';

  bool allowUserSignup = true;
  bool allowNotifications = true;

  // Dropdown options
  final List<String> languages = ['English', 'Spanish', 'French'];
  final List<String> themes = ['Light Theme', 'Dark Theme'];
  final List<String> tzOptions = [
    'CET - Central European Time',
    'EST - Eastern Standard Time',
    'PST - Pacific Standard Time',
  ];
  final List<String> dateFormats = ['DD/MM/YYYY', 'MM/DD/YYYY', 'YYYY-MM-DD'];
  final List<String> currencyOptions = ['USD (\$)', 'EUR (€)', 'GBP (£)'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: _buildCard(
        title: 'General',
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 720;
            final fields = _buildFields();

            if (isNarrow) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: fields
                    .map(
                      (f) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: f,
                      ),
                    )
                    .toList(),
              );
            }

            return Wrap(
              spacing: 36,
              runSpacing: 20,
              children: fields
                  .map(
                    (f) => SizedBox(
                      width: (constraints.maxWidth - 36) / 2,
                      child: f,
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }

  /// ========== CARD CONTAINER ==========
  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kCardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.dmSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: kTextPrimary,
            ),
          ),
          const SizedBox(height: 22),
          child,
        ],
      ),
    );
  }

  /// ========== ALL FIELD WIDGETS ==========
  List<Widget> _buildFields() {
    return [
      _fieldLabelControl(
        'System Language',
        _dropdown(
          systemLanguage,
          languages,
          (v) => setState(() => systemLanguage = v!),
        ),
      ),
      _fieldLabelControl(
        'User Sign up',
        _toggle(
          'Allow new users to sign up',
          allowUserSignup,
          (v) => setState(() => allowUserSignup = v),
        ),
      ),
      _fieldLabelControl(
        'Admin Dashboard Theme',
        _dropdown(adminTheme, themes, (v) => setState(() => adminTheme = v!)),
      ),
      _fieldLabelControl(
        'Default Theme for Users',
        _dropdown(
          defaultUserTheme,
          themes,
          (v) => setState(() => defaultUserTheme = v!),
        ),
      ),
      _fieldLabelControl(
        'Time Zone',
        _dropdown(timeZone, tzOptions, (v) => setState(() => timeZone = v!)),
      ),
      _fieldLabelControl(
        'Date and Time Format',
        _dropdown(
          dateFormat,
          dateFormats,
          (v) => setState(() => dateFormat = v!),
        ),
      ),
      _fieldLabelControl(
        'Currency',
        _dropdown(
          currency,
          currencyOptions,
          (v) => setState(() => currency = v!),
        ),
      ),
      _fieldLabelControl(
        'Notifications',
        _toggle(
          'Allow system notifications',
          allowNotifications,
          (v) => setState(() => allowNotifications = v),
        ),
      ),
    ];
  }

  /// ========== LABEL + CONTROL ==========
  Widget _fieldLabelControl(String label, Widget control) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.dmSans(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: kTextSecondary,
          ),
        ),
        const SizedBox(height: 8),
        control,
      ],
    );
  }

  /// ========== DROPDOWN ==========
  Widget _dropdown(
    String value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return SizedBox(
      height: 44,
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kInputBorder, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: kAccentGreen.withOpacity(0.9),
              width: 1.4,
            ),
          ),
        ),
        style: GoogleFonts.dmSans(fontSize: 14, color: kTextPrimary),
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items
            .map((it) => DropdownMenuItem<String>(value: it, child: Text(it)))
            .toList(),
      ),
    );
  }

  /// ========== TOGGLE ==========
  Widget _toggle(String title, bool value, ValueChanged<bool> onChanged) {
    return SizedBox(
      height: 44,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.dmSans(fontSize: 13, color: kSubtitle),
            ),
          ),
          AccentToggle(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

/// ========== CUSTOM TOGGLE ==========
class AccentToggle extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AccentToggle({super.key, required this.value, required this.onChanged});

  @override
  State<AccentToggle> createState() => _AccentToggleState();
}

class _AccentToggleState extends State<AccentToggle> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(covariant AccentToggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) _value = widget.value;
  }

  void _toggle() {
    setState(() => _value = !_value);
    widget.onChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        width: 48,
        height: 28,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: _value ? kAccentGreen : const Color(0xFFECEFF1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
