import 'package:flutter/material.dart';

class AgePickerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          TextButton(
            onPressed: () {
              // Skip action
            },
            child: Text("Skip", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Step 3 of 8',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'HOW OLD ARE YOU?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.05),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 60, // Size of each item
                physics: FixedExtentScrollPhysics(),
                perspective: 0.005,
                childDelegate: ListWheelChildLoopingListDelegate(
                  children: List<Widget>.generate(10, (index) {
                    int age = 24 + index;
                    return Center(
                      child: Text(
                        '$age',
                        style: TextStyle(
                          fontSize: 24,
                          color: index == 3 ? Colors.black : Colors.grey, // Highlight selected item
                          fontWeight: index == 3 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Next steps action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'NEXT STEPS',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}

