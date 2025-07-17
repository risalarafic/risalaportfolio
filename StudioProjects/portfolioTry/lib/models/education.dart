import 'package:flutter/material.dart';

class MyEducationSection extends StatelessWidget {
  const MyEducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5DC),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              'Experience',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            Container(
              color: const Color(0xFFD1BFAE),
              width: 160,
              height: 2,
            ),
            const SizedBox(height: 30),
            // Subtitle
            Text(
              'Hands-on experience in mobile app development with a focus on UI/UX design, state management, and backend integration using Flutter and Firebase.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 30),

            // Timeline entries
            LayoutBuilder(
              builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 700;

                return Column(
                  children: [
                    _buildTimelineRow(
                      isMobile: isMobile,
                      leftTitle: 'Luminar TechnoLab',
                      leftSub: 'Present',
                      rightTitle: 'Flutter developer intern',
                      rightSub:
                      'Currently working as a Flutter Developer Intern at Luminar Technolab, focusing on UI design optimization, state management and backend integration with REST APIs and Firebase.',
                    ),
                    _buildTimelineRow(
                      isMobile: isMobile,
                      leftTitle: 'VSSC, ISRO',
                      leftSub: '2024 – 2025',
                      rightTitle: 'Graduate Apprentice Trainee',
                      rightSub:
                      'Worked on Python-based tools, automation scripts, and contributed to internal software systems.',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineRow({
    required bool isMobile,
    required String leftTitle,
    required String leftSub,
    required String rightTitle,
    required String rightSub,
  }) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            leftTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            leftSub,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFD1BFAE),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            rightTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              rightSub,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    leftTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    leftSub,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFD1BFAE),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 50),

            // Right Column
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rightTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    rightSub,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
