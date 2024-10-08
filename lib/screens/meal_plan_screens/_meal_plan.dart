import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/screens/meal_plan_screens/_meal_plan_details.dart';
import 'package:fitness_app/screens/meal_plan_screens/calender.dart';
import 'package:fitness_app/shared/app_colors.dart';
import 'package:flutter/material.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => MealPlanScreenState();
}

class MealPlanScreenState extends State<MealPlanScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDateSelector(),
            Expanded(
              child: DefaultTabController(
                length: 3, // Number of tabs
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      splashBorderRadius: BorderRadius.circular(10),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      // indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.white,
                      indicator: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      automaticIndicatorColorAdjustment: true,
                      tabs: const [
                        Tab(text: 'Breakfast'),
                        Tab(text: 'Lunch'),
                        Tab(text: 'Dinner'),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          FutureBuilder<QuerySnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('meals')
                                .where('category', isEqualTo: 'Breakfast')
                                .get(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              if (snapshot.hasError) {
                                return const Center(
                                    child: Text("Error loading data"));
                              }

                              if (snapshot.hasData) {
                                final meals = snapshot.data!.docs;

                                return ListView.builder(
                                  itemCount: meals.length,
                                  shrinkWrap: true,
                                  // padding: const EdgeInsets.only(top: 15),
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final meal = meals[index].data()
                                        as Map<String, dynamic>;

                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 190,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image:
                                                    NetworkImage(meal['image']),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            meal['title'], // Exercise title
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.access_time_outlined,
                                                size: 12,
                                                color: Color(0xFF00ADB5),
                                              ),
                                              Text(
                                                " ${meal['duration']}  |  ",
                                                // Exercise level
                                                style: const TextStyle(
                                                    color: Color(0xFF303841),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Icon(
                                                Icons.local_fire_department,
                                                size: 12,
                                                color: Color(0xFF00ADB5),
                                              ),
                                              Text(
                                                " ${meal['calories']}",
                                                // Duration
                                                style: const TextStyle(
                                                    color: Color(0xFF303841),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return const Center(
                                    child: Text("No data found"));
                              }
                            },
                          ),
                          FutureBuilder<QuerySnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('meals')
                                .where('category', isEqualTo: 'Lunch')
                                .get(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              if (snapshot.hasError) {
                                return const Center(
                                    child: Text("Error loading data"));
                              }

                              if (snapshot.hasData) {
                                final meals = snapshot.data!.docs;

                                return ListView.builder(
                                  itemCount: meals.length,
                                  shrinkWrap: true,
                                  // padding: const EdgeInsets.only(top: 15),
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final meal = meals[index].data()
                                        as Map<String, dynamic>;

                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 190,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image:
                                                    NetworkImage(meal['image']),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            meal['title'], // Exercise title
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.access_time_outlined,
                                                size: 12,
                                                color: Color(0xFF00ADB5),
                                              ),
                                              Text(
                                                " ${meal['duration']}  |  ",
                                                // Exercise level
                                                style: const TextStyle(
                                                    color: Color(0xFF303841),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Icon(
                                                Icons.local_fire_department,
                                                size: 12,
                                                color: Color(0xFF00ADB5),
                                              ),
                                              Text(
                                                " ${meal['calories']}",
                                                // Duration
                                                style: const TextStyle(
                                                    color: Color(0xFF303841),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return const Center(
                                    child: Text("No data found"));
                              }
                            },
                          ),
                          FutureBuilder<QuerySnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('meals')
                                .where('category', isEqualTo: 'Dinner')
                                .get(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              if (snapshot.hasError) {
                                return const Center(
                                    child: Text("Error loading data"));
                              }

                              if (snapshot.hasData) {
                                final meals = snapshot.data!.docs;

                                return ListView.builder(
                                  itemCount: meals.length,
                                  shrinkWrap: true,
                                  // padding: const EdgeInsets.only(top: 15),
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final meal = meals[index].data()
                                        as Map<String, dynamic>;

                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 190,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image:
                                                    NetworkImage(meal['image']),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            meal['title'], // Exercise title
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.access_time_outlined,
                                                size: 12,
                                                color: Color(0xFF00ADB5),
                                              ),
                                              Text(
                                                " ${meal['duration']}  |  ",
                                                // Exercise level
                                                style: const TextStyle(
                                                    color: Color(0xFF303841),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Icon(
                                                Icons.local_fire_department,
                                                size: 12,
                                                color: Color(0xFF00ADB5),
                                              ),
                                              Text(
                                                " ${meal['calories']}",
                                                // Duration
                                                style: const TextStyle(
                                                    color: Color(0xFF303841),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return const Center(
                                    child: Text("No data found"));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // buildMealCategorySelector(),
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Text(
            //     '15 Meals',
            //     style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.w700,
            //       fontFamily: 'Montserrat',
            //     ),
            //   ),
            // ),
            // buildMealList(),
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
          fontSize: 22,
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
      padding: EdgeInsets.symmetric(vertical: 10),
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
          color: isSelected ? Colors.black : Colors.white,
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
