import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/profile/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w400,
            fontFamily: 'Bebas',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ));
            },
          ),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Shimmer loading placeholder while data is being fetched
            return Center(child: const CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error Progress categories'));
          }
          if (snapshot.hasData && snapshot.data != null) {
            // final categories = snapshot.data!['progress'];

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile image and info
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/avatar.png'), // Replace with your image
                  ),
                  SizedBox(height: 16),
                  Text(
                    snapshot.data!['full-name'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  Text(
                    snapshot.data!['level'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Weight, Height, Age info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileInfoItem(
                          label: 'Weight',
                          value: '${snapshot.data!['weight']} kg'),
                      ProfileInfoItem(
                          label: 'Height',
                          value: '${snapshot.data!['height']} cm'),
                      ProfileInfoItem(
                          label: 'Age', value: '${snapshot.data!['age']} year'),
                    ],
                  ),
                  SizedBox(height: 24),

                  // Goal Section
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16.0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Goal',
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       SizedBox(height: 16),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           GoalItem(
                  //               imageUrl: 'assets/yoga.png', label: 'Yoga'),
                  //           GoalItem(imageUrl: 'assets/gym.png', label: 'Gym'),
                  //           GoalItem(
                  //               imageUrl: 'assets/cardio.png', label: 'Cardio'),
                  //           GoalItem(
                  //               imageUrl: 'assets/stretch.png',
                  //               label: 'Stretch'),
                  //           GoalItem(
                  //               imageUrl: 'ass ets/full_body.png',
                  //               label: 'Full Body'),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 24),

                  // Macronutrient Goals Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MACRONUTRIENT GOALS',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Bebas'),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NutrientGoalItem(
                              imageUrl: 'assets/images/protein.png',
                              label: 'Protein',
                              amountNumber: '130',
                              amount: 'Grams per day',
                            ),
                            NutrientGoalItem(
                              imageUrl: 'assets/images/carbs.png',
                              label: 'Carbs',
                              amountNumber: '235',
                              amount: 'Grams per day',
                            ),
                            NutrientGoalItem(
                              imageUrl: 'assets/images/fat.png',
                              label: 'Fat',
                              amountNumber: '60',
                              amount: 'Grams per day',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No Progress found'));
          }
        },
      ),
    );
  }
}

// Widget for the profile info (Weight, Height, Age)
class ProfileInfoItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

// Widget for goal items (Yoga, Gym, etc.)
class GoalItem extends StatelessWidget {
  final String imageUrl;
  final String label;

  const GoalItem({super.key, required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imageUrl), // Replace with your goal image
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

// Widget for macronutrient goals (Protein, Carbs, Fat)
class NutrientGoalItem extends StatelessWidget {
  final String imageUrl;
  final String label;
  final String amountNumber;
  final String amount;

  const NutrientGoalItem({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.amountNumber,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          amountNumber,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
