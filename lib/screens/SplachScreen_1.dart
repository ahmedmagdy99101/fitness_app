import 'package:flutter/material.dart';

class SplashFitnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFD6E686), // Light green
              Color(0xFFF6F6F0), // Soft white/yellowish color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Fitness Model Image
                  Positioned(
                    top: 80,
                    child: Image.asset(
                      'images/girl-doing-biceps-with-dumbbells-model-with-ginger-hair-black-sportwear-bright-gym-fitness-balls-besides_prev_ui 1.png',
                      // Add your asset path here
                      width: 250,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Top Badge (97 BFM)
                  Positioned(
                    top: 250,
                    right: 20,
                    child: _buildBadge(
                      "97 BFM",
                      "3 mins ago",
                      Icons.favorite,
                    ),
                  ),

                  // Top Left Badge (Find a gym near you)
                  Positioned(
                    top: 300,
                    left: 20,
                    child: _buildBadge(
                      "Find a gym \nnear you",
                      "Search the best \ngym in your area \nand get points",
                    ),
                  ),

                  // Bottom Left Badge (1.5 members)
                  Positioned(
                    bottom: 50,
                    left: 20,
                    child: _buildBadge(
                      "1.5 members",
                      null,
                      Icons.group,
                    ),
                  ),
                ],
              ),
            ),

            // Title: PRO FITNESS
            RichText(
              text: const TextSpan(
                text: 'PRO ',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'FITNESS',
                    style: TextStyle(
                      color: Color(0xFF97C45B), // Green for FITNESS
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),

            // Subtitle: "We train your body to be great and fit."
            const Text(
              "We train your body to be \n           great and fit.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 32),

            // Start Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Black button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "LET'S START",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Reusable function to build the badge with optional icons and subtitles
  Widget _buildBadge(String title, [String? subtitle, IconData? icon]) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.red,
                  size: 16,
                ),
              const SizedBox(width: 4),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
