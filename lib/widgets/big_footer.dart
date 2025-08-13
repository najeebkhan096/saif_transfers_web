import 'package:flutter/material.dart';

enum FooterBreakpoint { mobile, tablet, desktop }

class ResponsiveFooter extends StatelessWidget {
  final double maxWidth;
  final List<FooterSection> sections;

  const ResponsiveFooter({
    super.key,
    this.maxWidth = 1180,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final breakpoint = _getBreakpoint(w);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE9E9E9))),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: LayoutBuilder(
            builder: (context, constraints) {
              int columns = _getColumnCount(breakpoint);
              double spacing = breakpoint == FooterBreakpoint.mobile ? 14 : 30;

              double itemWidth =
                  (constraints.maxWidth - (spacing * (columns - 1))) / columns;

              return Wrap(
                spacing: spacing,
                runSpacing: 14,
                children: sections.map((section) {
                  return SizedBox(
                    width: itemWidth,
                    child: FooterColumn(
                      section: section,
                      titleSize: _getTitleFontSize(breakpoint),
                      itemSize: _getItemFontSize(breakpoint),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }

  FooterBreakpoint _getBreakpoint(double width) {
    if (width < 780) return FooterBreakpoint.mobile;
    if (width < 1100) return FooterBreakpoint.tablet;
    return FooterBreakpoint.desktop;
  }

  int _getColumnCount(FooterBreakpoint bp) {
    switch (bp) {
      case FooterBreakpoint.mobile:
        return 2;
      case FooterBreakpoint.tablet:
        return 3;
      case FooterBreakpoint.desktop:
        return 4;
    }
  }

  double _getTitleFontSize(FooterBreakpoint bp) {
    switch (bp) {
      case FooterBreakpoint.mobile:
        return 14;
      case FooterBreakpoint.tablet:
        return 15;
      case FooterBreakpoint.desktop:
        return 16;
    }
  }

  double _getItemFontSize(FooterBreakpoint bp) {
    switch (bp) {
      case FooterBreakpoint.mobile:
        return 12;
      case FooterBreakpoint.tablet:
        return 13;
      case FooterBreakpoint.desktop:
        return 14;
    }
  }
}

class FooterSection {
  final String title;
  final List<String> items;
  FooterSection({required this.title, required this.items});
}

class FooterColumn extends StatelessWidget {
  final FooterSection section;
  final double titleSize;
  final double itemSize;

  const FooterColumn({
    super.key,
    required this.section,
    required this.titleSize,
    required this.itemSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.title,
          style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        ...section.items.map((t) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(t, style: TextStyle(fontSize: itemSize)),
        )),
      ],
    );
  }
}
