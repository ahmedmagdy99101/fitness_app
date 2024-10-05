import 'package:flutter/material.dart';




class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size and orientation
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            // Handle back button
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,  // 5% of screen width
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02), // Add space at the top
            Text(
              "LET'S GET STARTED",
              style: TextStyle(
                fontSize: screenWidth * 0.08,  // Responsive text size
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.",
              style: TextStyle(
                fontSize: screenWidth * 0.045,  // Responsive text size
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.05),  // Space before the image
            Container(
              height: screenHeight * 0.3,  // Image takes up 30% of the screen height
              width: screenHeight * 0.3,
              decoration: BoxDecoration(
                color: Colors.yellowAccent,  // Background circle color
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'images/unnamed-removebg-preview 1.png', // Image of the person in yoga pose
                  height: screenHeight * 0.70,  // Image height
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Sculpt your ideal body, free your true self, transform your life.",
              style: TextStyle(
                fontSize: screenWidth * 0.045,  // Responsive text size
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.08,  // Button height based on screen size
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,  // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),  // Rounded corners
                  ),
                ),
                child: Text(
                  'GET STARTED!',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,  // Responsive text size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),  // Space at the bottom
          ],
        ),
      ),
    );
  }
}
