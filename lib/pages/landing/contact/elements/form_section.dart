import 'package:flutter/material.dart';

import '../../../../theme/theme_helper.dart';
import '../../../../widgets/custom_button.dart';

class FormSection extends StatefulWidget {
  const FormSection({super.key});
  @override
  State<FormSection> createState() => FormSectionState();
}

class FormSectionState extends State<FormSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;

            // Breakpoints
            bool isMobile = width < 600;
            bool isTablet = width >= 600 && width < 1024;
            bool isDesktop = width >= 1024;

            double maxContentWidth = isDesktop ? 900 : width * 0.95;
            bool singleColumn = isMobile || isTablet && width < 720;

            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxContentWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Leave us your info',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: isMobile
                            ? 22
                            : isTablet
                            ? 26
                            : 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    height: 600,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Name & Email row
                          Flex(
                            direction: singleColumn ? Axis.vertical : Axis.horizontal,
                            children: singleColumn
                                ? [
                              _LabeledField(
                                label: 'Your name',
                                hint: 'Enter your name',
                              ),
                              const SizedBox(height: 16),
                              _LabeledField(
                                label: 'Your email',
                                hint: 'name@example.com',
                              ),
                            ]
                                : [
                              Expanded(
                                child: _LabeledField(
                                  label: 'Your name',
                                  hint: 'Enter your name',
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: _LabeledField(
                                  label: 'Your email',
                                  hint: 'name@example.com',
                                ),
                              ),
                            ],
                          )
,
                          const SizedBox(height: 16),
                          _LabeledField(label: 'Subject', hint: 'Subject'),
                          const SizedBox(height: 16),
                          _LabeledField(
                            label: 'Your message (optional)',
                            hint: 'Type your message...',
                            maxLines: 8,
                          ),
                          const SizedBox(height: 18),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomButton(
                              text: 'Submit',
                              textColor: appTheme.whiteCustom,
                              height: isMobile ? 45 : 50,
                              width: isMobile ? 130 : 150,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // submit logic
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label, hint;
  final int maxLines;
  const _LabeledField({
    required this.label,
    required this.hint,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final fill = const Color(0xFFF3F3F3);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: isMobile ? 13 : 15,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          maxLines: maxLines,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            hintTextDirection: TextDirection.ltr,
            hintText: hint,
            hintStyle: TextStyle(fontSize: isMobile ? 13 : 14),
            filled: true,
            fillColor: fill,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }
}

