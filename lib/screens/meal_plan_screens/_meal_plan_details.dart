import 'package:flutter/material.dart';

class MealPlanDetails extends StatefulWidget {
  const MealPlanDetails({super.key});

  @override
  State<MealPlanDetails> createState() => _MealPlanDetailsState();
}

class _MealPlanDetailsState extends State<MealPlanDetails> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/meal1.png',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Title and Nutritional Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Row(
                            children: [
                              Icon(Icons.local_fire_department),
                              SizedBox(width: 4),
                              Text('135 kcal'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Row(
                            children: [
                              Icon(Icons.timer),
                              SizedBox(width: 4),
                              Text('5 min'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NutrientInfo(title: 'Fat', value: '1.5 g'),
                      NutrientInfo(title: 'Protein', value: '10.9 g'),
                      NutrientInfo(title: 'Carbs', value: '13.5 g'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Healthy Balanced Vegetarian Food',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'There are many variations of passages of Lorem Ipsum available...',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                ],
              ),
            ),

            // Meal Plan List
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                MealPlanItem(
                  title: 'Tortilla wrap with falafel and fresh salad',
                  imageUrl: 'assets/images/meal1.png', // Add your image here
                  fat: '1.5 g',
                  protein: '10.9 g',
                  carbs: '13.5 g',
                ),
                MealPlanItem(
                  title: 'Healthy vegan salad of vegetables',
                  imageUrl: 'assets/images/meal2.png', // Add your image here
                  fat: '1.5 g',
                  protein: '10.9 g',
                  carbs: '13.5 g',
                ),
                MealPlanItem(
                  title: 'Ketogenic/paleo diet. fried eggs, salmon',
                  imageUrl: 'assets/images/meal3.png', // Add your image here
                  fat: '1.5 g',
                  protein: '10.9 g',
                  carbs: '13.5 g',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for nutrient info
class NutrientInfo extends StatelessWidget {
  final String title;
  final String value;

  const NutrientInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(value),
      ],
    );
  }
}

// Custom widget for meal plan item
class MealPlanItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String fat;
  final String protein;
  final String carbs;

  const MealPlanItem({super.key, 
    required this.title,
    required this.imageUrl,
    required this.fat,
    required this.protein,
    required this.carbs,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fat: $fat'),
                    Text('Protein: $protein'),
                    Text('Carbs: $carbs'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}