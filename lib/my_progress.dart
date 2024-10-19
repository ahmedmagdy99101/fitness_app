import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Shimmer loading placeholder while data is being fetched
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error Progress categories'));
          }
          if (snapshot.hasData && snapshot.data != null) {
            // final categories = snapshot.data!['progress'];

            return Column(
              children: [
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    children: [
                      ProgressCircle(
                        title: 'Walk',
                        progress: (snapshot.data!['progress-walk'] / 6000),
                        value: '${snapshot.data!['progress-walk']}',
                        unit: 'Steps',
                        icon: Icons.directions_walk_outlined,
                      ),
                      ProgressCircle(
                          title: 'Sleep',
                          progress: (snapshot.data!['progress-sleep'] / 8),
                          value: '${snapshot.data!['progress-sleep']}',
                          unit: 'Hours',
                          icon: Icons.bed_outlined),
                      ProgressCircle(
                          title: 'Exercises',
                          progress: (snapshot.data!['progress-exercise'] / 15),
                          value: '${snapshot.data!['progress-exercise']}',
                          unit: 'exercise',
                          icon: Icons.favorite_border_outlined),
                      ProgressCircle(
                        title: 'Calories',
                        progress: (snapshot.data!['progress-calories'] / 2400),
                        value: '${snapshot.data!['progress-calories']}',
                        unit: 'Kcal',
                        icon: Icons.local_fire_department_outlined,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No Progress found'));
          }
        },
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
                    valueColor: const AlwaysStoppedAnimation(Color(0xFFB0C929)),
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
