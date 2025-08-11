
import 'package:flutter/material.dart';

/// =================== TESTIMONIALS ===================
class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.red.shade50,
      child: Column(
        children: const [
          Text("Hear what our amazing customers say",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(
              "“On the other hand, denounce righteous indignation and dislike men who are beguiled…”",
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
