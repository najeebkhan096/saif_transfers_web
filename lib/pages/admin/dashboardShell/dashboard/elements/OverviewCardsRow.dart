// ignore_for_file: file_names

import 'package:flutter/material.dart'
    show BuildContext, Colors, Column, EdgeInsets, Expanded, LayoutBuilder, MainAxisAlignment, Padding, Row, SizedBox, StatelessWidget, Widget, Wrap, Color;

import '../../../../../core/utils/images.dart';
import 'OverviewCard.dart';

/// Overview Cards Row (Responsive)
class OverviewCardsRow extends StatelessWidget {
  const OverviewCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      OverviewCard(
        title: 'Total Orders',
        value: '20',
        color: Color(0xff3366FF),
        imagePath: ImageConstants.blueBox,
      ),
      OverviewCard(
        title: 'Total Earnings',
        value: '15',
        color: Color(0xffFF333F),
        imagePath: ImageConstants.redBox,
      ),
      OverviewCard(
        title: 'Profit',
        value: '8',
        color: Color(0xffFF9533),
        imagePath: ImageConstants.yellowBox,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width >= 700) {
          // Desktop/tablet: horizontal row with spacing
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: cards
                .map(
                  (card) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: card,
                    ),
                  ),
                )
                .toList(),
          );
        } else if (width >= 400) {
          // Medium width: grid 2 columns
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: cards
                .map((card) => SizedBox(width: (width / 2) - 16, child: card))
                .toList(),
          );
        } else {
          // Mobile/narrow: stack vertically with spacing
          return Column(
            children: cards
                .map(
                  (card) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: card,
                  ),
                )
                .toList(),
          );
        }
      },
    );
  }
}
