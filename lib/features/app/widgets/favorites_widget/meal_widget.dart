import 'package:flutter/material.dart';

class MealWidget extends StatelessWidget {
  final List<Meal> meals;

  const MealWidget({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => mealCard(meals[index]),
          itemCount: meals.length,
        ),
      ),
    );
  }

  Widget mealCard(Meal meal) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          meal.imagePath,
          height: 200,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      Text(
        meal.name,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        children: [
          const Icon(
            Icons.local_fire_department_outlined,
            color: Colors.blueAccent,
            size: 20,
          ),
          Text(
            meal.calories,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const Text('  |  '),
          const Icon(
            Icons.access_time,
            color: Colors.blueAccent,
            size: 14,
          ),
          Text(
            meal.time,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 40,
      ),
    ],
  );
}

class Meal {
  final String imagePath;
  final String name;
  final String calories;
  final String time;

  Meal({
    required this.imagePath,
    required this.name,
    required this.calories,
    required this.time,
  });
}
