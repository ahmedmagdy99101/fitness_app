import 'package:fitness_app/features/login/screens/login_screen/login_screen.dart';
import 'package:fitness_app/features/login/screens/register_screen/register_screen.dart';
import 'package:fitness_app/screens/WelcomeScreen_3.dart';
import 'package:flutter/material.dart';

class WelcomeCrossfitScreen extends StatelessWidget {
  const WelcomeCrossfitScreen({super.key});

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
                backgroundImage: AssetImage(
                    'assets/images/horizontal.png'), // Replace with your asset
              ),
            ),

            const SizedBox(height: 40),

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

            const Spacer(),

            // Bottom Navigation: SKIP, Indicator, NEXT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SKIP Button
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
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
                      Icon(Icons.circle, size: 12, color: Color(0xFFA2D05D)),
                      // Active dot
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 12, color: Colors.black38),
                      // Inactive dot
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 12, color: Colors.black38),
                      // Inactive dot
                    ],
                  ),

                  // NEXT Button
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomefitScreen()));
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
