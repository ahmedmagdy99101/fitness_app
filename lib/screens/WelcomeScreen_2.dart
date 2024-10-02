import 'package:flutter/material.dart';





class WelcomeCrossfitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFDEDB2), // Light yellow at the top
              Color(0xFFF9D3CD), // Light pink at the bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),

            // Circular Image with Background
            const CircleAvatar(
              radius: 150,
              backgroundColor: Color(0xFFA2D05D), // Green background
              child: CircleAvatar(
                radius: 140,
                backgroundImage: AssetImage('images/horizontal-shot-satisfied-motivated-sportswoman-has-regular-training-raises-arms-with-dumbbells-does-exercises-muscles-dressed-sportswear-smiles-toothily-isolated-pink-wall-sport-concept-removebg-prev 1.png'), // Replace with your asset
              ),
            ),

            const SizedBox(height: 40),

            // Title: PERFECT BODY DOING CROSSFIT EXERCISES
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'PERFECT BODY\nDOING ',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'CROSSFIT\n',
                      style: TextStyle(
                        color: Color(0xFFA2D05D), // Green for CROSSFIT
                      ),
                    ),
                    TextSpan(text: 'EXERCISES'),
                  ],
                ),
              ),
            ),

            Spacer(),

            // Bottom Navigation: SKIP, Indicator, NEXT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SKIP Button
                  TextButton(
                    onPressed: () {
                      // Skip action
                    },
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  // Indicator
                  const Row(
                    children: [
                      Icon(Icons.circle, size: 12, color: Color(0xFFA2D05D)), // Active dot
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 12, color: Colors.black38), // Inactive dot
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 12, color: Colors.black38), // Inactive dot
                    ],
                  ),

                  // NEXT Button
                  TextButton(
                    onPressed: () {
                      // Next action
                    },
                    child: const Text(
                      'NEXT',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}