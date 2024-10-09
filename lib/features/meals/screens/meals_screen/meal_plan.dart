import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/features/meals/widgets/calender.dart';
import 'package:fitness_app/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
                    const SizedBox(
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
                                  child: CircularProgressIndicator(),
                                );
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
                                          // CachedNetworkImage with Shimmer placeholder
                                          CachedNetworkImage(
                                            imageUrl: meal['image'],
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                Container(
                                                  width: double.infinity,
                                                  height: 190,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor: Colors
                                                      .grey[100]!,
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 190,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                    ),
                                                  ),
                                                ),
                                            errorWidget: (context, url,
                                                error) =>
                                            const SizedBox(
                                                height: 190,
                                                width: double.infinity,
                                                child: Center(
                                                    child:
                                                    Icon(Icons.error))),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            meal['title'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
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
                                                style: const TextStyle(
                                                  color: Color(0xFF303841),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.local_fire_department,
                                                size: 12,
                                                color: Color(0xFF00ADB5),
                                              ),
                                              Text(
                                                " ${meal['calories']}",
                                                style: const TextStyle(
                                                  color: Color(0xFF303841),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
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
                                  child: CircularProgressIndicator(),
                                );
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
                                          CachedNetworkImage(
                                            imageUrl: meal['image'],
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                Container(
                                                  width: double.infinity,
                                                  height: 190,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor: Colors
                                                      .grey[100]!,
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 190,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                    ),
                                                  ),
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                            const Icon(Icons.error),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            meal['title'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
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
                                                style: const TextStyle(
                                                  color: Color(0xFF303841),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.local_fire_department,
                                                size: 12,
                                                color: Color(0xFF00ADB5),
                                              ),
                                              Text(
                                                " ${meal['calories']}",
                                                style: const TextStyle(
                                                  color: Color(0xFF303841),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
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
                                  child: CircularProgressIndicator(),
                                );
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
                                          CachedNetworkImage(
                                            imageUrl: meal['image'],
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                Container(
                                                  width: double.infinity,
                                                  height: 190,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor: Colors
                                                      .grey[100]!,
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 190,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                    ),
                                                  ),
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                            const Icon(Icons.error),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            meal['title'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
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
                                                style: const TextStyle(
                                                  color: Color(0xFF303841),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.local_fire_department,
                                                size: 12,
                                                color: Color(0xFF00ADB5),
                                              ),
                                              Text(
                                                " ${meal['calories']}",
                                                style: const TextStyle(
                                                  color: Color(0xFF303841),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
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

}


