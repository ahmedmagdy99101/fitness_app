import 'package:flutter/material.dart';

class MyProgress extends StatelessWidget {
  const MyProgress({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Progress'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              children: const [
                ProgressCircle(
                  title: 'Walk',
                  progress: 0.45,
                  value: '2265',
                  unit: 'Steps',
                  icon: Icons.directions_walk_outlined,
                ),
                ProgressCircle(
                  title: 'Sleep',
                  progress: 0.75,
                  value: '8:50',
                  unit: 'Hours',
                  icon: Icons.bed_outlined
                ),
                ProgressCircle(
                  title: 'Heart',
                  progress: 0.65,
                  value: '115',
                  unit: 'bpm',
                  icon: Icons.favorite_border_outlined
                ),

                ProgressCircle(
                  title: 'Calories',
                  progress: 0.60,
                  value: '399',
                  unit: 'Kcal',
                  icon: Icons.local_fire_department_outlined,

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressCircle extends StatelessWidget {
  final String title;
  final double progress;
  final String value;
  final String unit;
  final IconData icon;

  const ProgressCircle({
    super.key,
    required this.title,
    required this.progress,
    required this.value,
    required this.unit,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 8,
                    valueColor: AlwaysStoppedAnimation(Color(0xFFB0C929)),
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      unit,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

