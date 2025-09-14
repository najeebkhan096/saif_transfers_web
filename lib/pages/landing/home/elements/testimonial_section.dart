import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';

/// =================== TESTIMONIALS ===================
class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> testimonials = [
    {
      "name": "John Doe",
      "image":
          "https://corsproxy.io/?https://www.punjabkesari.com/wp-content/uploads/2025/07/aneet-padda-26.webp",
      "rating": 5,
      "description":
          '''On the other hand denounce righteous indignation and dislike men who beguile and demoralize charms pleasure the moment blinded desire cannot foresee  pain and trouble that are bound to ensue''',
    },
    {
      "name": "Sarah Smith",
      "image":
          "https://corsproxy.io/?https://pbs.twimg.com/media/GwOH6kVakAAt66Y?format=jpg&name=large",
      "rating": 4,
      "description":
          '''On the other hand denounce righteous indignation and dislike men who beguile and demoralize charms pleasure the moment blinded desire cannot foresee  pain and trouble that are bound to ensue''',
    },
    {
      "name": "Michael Johnson",
      "image":
          "https://corsproxy.io/?https://www.punjabkesari.com/wp-content/uploads/2025/07/aneet-padda-26.webp",
      "rating": 5,
      "description":
          '''On the other hand denounce righteous indignation and dislike men who beguile and demoralize charms pleasure the moment blinded desire cannot foresee  pain and trouble that are bound to ensue''',
    },
  ];

  void _goToPage(int index) {
    if (index >= 0 && index < testimonials.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 30 : 120,
            horizontal: isMobile ? 20 : 80,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: isMobile ? 20 : 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFDEEEC),
          ),

          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeftSection(isMobile, constraints.maxWidth),
                    const SizedBox(height: 30),
                    _buildRightSection(isMobile, constraints.maxWidth),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildLeftSection(isMobile, constraints.maxWidth),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: _buildRightSection(isMobile, constraints.maxWidth),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildLeftSection(bool isMobile, double width) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.start,
      children: [
        Text(
          "Hear what our amazing customers say",
          style: GoogleFonts.dmSans(
            fontSize: isMobile ? 20 : 44.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Sad ipscing elitrsed diamnonu myeir mod, sadipscing elitrsed dia morem ipsum dolor situamet consetetur loutrytru.",
          textAlign: isMobile ? TextAlign.start : TextAlign.start,
          style: GoogleFonts.dmSans(fontSize: isMobile ? 14 : 16),
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: "Get started",
          height: isMobile ? 45 : 50,
          width: isMobile ? 130 : 150,
        ),
      ],
    );
  }

  Widget _buildRightSection(bool isMobile, double width) {
    return SizedBox(
      height: isMobile ? 350 : 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Carousel
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final t = testimonials[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Info
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(t["image"]),
                            radius: isMobile ? 20 : 25,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              t["name"],
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 14 : 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Stars
                      Row(
                        children: List.generate(
                          t["rating"],
                          (starIndex) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: isMobile ? 18 : 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Description
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            t["description"],
                            style: GoogleFonts.dmSans(
                              fontSize: isMobile ? 13 : 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // Navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _circleButton(
                Icons.arrow_back,
                () => _goToPage(_currentPage - 1),
              ),
              const SizedBox(width: 16),
              Text(
                "${_currentPage + 1} / ${testimonials.length}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              _circleButton(
                Icons.arrow_forward,
                () => _goToPage(_currentPage + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
