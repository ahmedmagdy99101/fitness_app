import 'package:flutter/material.dart';



class UserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // First Section: Weight
              const UserInfoSection(
                step: 4,
                question: "How much do you weigh?",
                unit1: "LBS",
                unit2: "KG",
                defaultValue: "87",
                selectedUnit: "kg",
              ),
              SizedBox(height: 20),

              // Second Section: Height
              const UserInfoSection(
                step: 6,
                question: "What's your goal weight?",
                unit1: "LBS",
                unit2: "KG",
                defaultValue: "85",
                selectedUnit: "cm",
              ),
              const UserInfoSection(
                step: 6,
                question: "How much do you Height?",
                unit1: "FEET",
                unit2: "CM",
                defaultValue: "85",
                selectedUnit: "cm",
              ),

              // Next Step Button
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("Next Steps"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoSection extends StatelessWidget {
  final int step;
  final String question;
  final String unit1;
  final String unit2;
  final String defaultValue;
  final String selectedUnit;

  const UserInfoSection({
    Key? key,
    required this.step,
    required this.question,
    required this.unit1,
    required this.unit2,
    required this.defaultValue,
    required this.selectedUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Step $step of 8", style: TextStyle(color: Colors.grey)),
        SizedBox(height: 8),
        Text(
          question,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),

        // Toggle between units
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButton(unit: unit1, isSelected: selectedUnit == unit1.toLowerCase()),
            ToggleButton(unit: unit2, isSelected: selectedUnit == unit2.toLowerCase()),
          ],
        ),
        SizedBox(height: 20),

        // Input Field for Value
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              defaultValue,
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(width: 10),
            Text(
              selectedUnit,
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 10),

      ],
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String unit;
  final bool isSelected;

  const ToggleButton({required this.unit, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: isSelected ? Colors.white : Colors.black, backgroundColor: isSelected ? Colors.grey : Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: Colors.grey),
            ),
          ),
          child: Text(unit),
        ),
      ),
    );
  }
}

