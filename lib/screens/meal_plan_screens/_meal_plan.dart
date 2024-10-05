import 'package:fitness_app/screens/meal_plan_screens/_meal_plan_details.dart';
import 'package:fitness_app/screens/meal_plan_screens/calender.dart';
import 'package:flutter/material.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDateSelector(),
            buildMealCategorySelector(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '15 Meals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            buildMealList(),
          ],
        ),
      ),
    );
  }

  // App Bar
  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'MEAL PLAN',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          fontFamily: 'Bebas',
        ),
      ),
      centerTitle: true,
      // leading: const Icon(Icons.arrow_back),
      actions: const [
        Icon(Icons.lightbulb_outline),
        SizedBox(width: 16),
      ],
    );
  }

  Widget buildDateSelector() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: HorizontalCalendar(),
    );
  }

  // Meal Category Selector (Breakfast, Lunch, Dinner)
  Widget buildMealCategorySelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          buildMealButton('Breakfast', true),
          buildMealButton('Lunch', false),
          buildMealButton('Dinner', false),
        ],
      ),
    );
  }

  Widget buildMealButton(String text, bool isSelected) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: MaterialButton(
          onPressed: () {},
          color: isSelected ? Colors.green : Colors.grey[200],
          textColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(text,
              style: const TextStyle(
                fontFamily: 'Montserrat',
              )),
        ),
      ),
    );
  }

  // Meal List
  Widget buildMealList() {
    return Expanded(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MealPlanDetails(),
                ),
              );
            },
            child: Stack(
              children: [
                buildMealItem(
                  'assets/images/meal1.png',
                  'Green beans, tomatoes, eggs',
                  '133 kcal',
                  '30 min',
                ),
                Positioned(
                  top: 20,
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
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 16,
            ),
            child: Divider(
              color: Colors.grey.withOpacity(.5),
              height: 4,
            ),
          ),
          Stack(
            children: [
              buildMealItem(
                'assets/images/meal2.png',
                'Healthy balanced vegetarian food',
                '215 kcal',
                '40 min',
              ),
              Positioned(
                top: 20,
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
                      isFavorite ? Icons.lock_open : Icons.lock,
                      color: isFavorite ? Colors.red : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 16,
            ),
            child: Divider(
              color: Colors.grey.withOpacity(.5),
              height: 4,
            ),
          ),
          Stack(
            children: [
              buildMealItem(
                'assets/images/meal3.png',
                'Fresh egg salad',
                '280 kcal',
                '25 min',
              ),
              Positioned(
                top: 20,
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
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 16,
            ),
            child: Divider(
              color: Colors.grey.withOpacity(.5),
              height: 4,
            ),
          ),
        ],
      ),
    );
  }

  // Meal Item Widget
  Widget buildMealItem(
    String imagePath,
    String title,
    String calories,
    String duration,
  ) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Montserrat'),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.local_fire_department, size: 16),
                    const SizedBox(width: 4),
                    Text(calories),
                    const SizedBox(width: 16),
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 4),
                    Text(duration),
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

// Bottom Navigation Bar
//   Widget buildBottomNavigationBar() {
//     return BottomNavigationBar(
//       backgroundColor: Colors.grey,
//       currentIndex: 1, // Selects the 'Meal Plans' tab
//       items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.restaurant_menu), label: 'Meal Plans'),
//         BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Exercise'),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       ],
//     );
//   }
// }
