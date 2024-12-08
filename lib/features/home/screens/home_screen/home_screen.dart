import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app/cubit/app_cubit/app_cubit.dart';
import '../../../meals/screens/meals_details_screen/meal_plan_details.dart';
import '../../cubit/home_cubit/home_cubit.dart';
import '../categories_details_screen/categories_details_screen.dart';
import '../categories_screen/categories_screen.dart';
import '../notifications_screen/notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(30, 15),
                bottomRight: Radius.elliptical(30, 15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState!.openDrawer();
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/menu_icon.png',
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              'assets/images/avatar.png',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Welcome back ,",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                (FirebaseAuth.instance.currentUser!
                                            .displayName ==
                                        null)
                                    ? 'new user'
                                    : FirebaseAuth.instance.currentUser!
                                            .displayName!.isEmpty
                                        ? 'new user'
                                        : FirebaseAuth
                                            .instance.currentUser!.displayName!,
                                style: TextStyle(
                                    color: Colors.grey[100], fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const NotificationsScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/home_main_banner.png",
                    width: double.infinity,
                    // height: 200,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Text("Select your Goal".toUpperCase(),
                  //     style: const TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.normal,
                  //       fontFamily: "Bebas",
                  //     )),
                  // BlocBuilder<HomeCubit, HomeState>(
                  //   builder: (context, state) {
                  //     final cubit = HomeCubit.get(context);
                  //     return SizedBox(
                  //       height: 70,
                  //       child: ListView.separated(
                  //         padding: const EdgeInsets.symmetric(vertical: 14),
                  //         scrollDirection: Axis.horizontal,
                  //         itemBuilder: (context, index) {
                  //           return InkWell(
                  //             onTap: () {
                  //               cubit.selectGoal(index);
                  //             },
                  //             child: AnimatedContainer(
                  //               duration: const Duration(milliseconds: 200),
                  //               padding: const EdgeInsets.symmetric(
                  //                 vertical: 10,
                  //                 horizontal: 20,
                  //               ),
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(8),
                  //                 color: cubit.selectedGoal == index
                  //                     ? Colors.black
                  //                     : Colors.grey[300]!,
                  //               ),
                  //               child: Text(
                  //                 cubit.goalsLabels[index],
                  //                 style: TextStyle(
                  //                   fontSize: 14,
                  //                   fontWeight: FontWeight.w500,
                  //                   color: cubit.selectedGoal == index
                  //                       ? Colors.white
                  //                       : const Color(0xFF303841),
                  //                 ),
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //         separatorBuilder: (context, index) {
                  //           return const SizedBox(
                  //             width: 10,
                  //           );
                  //         },
                  //         itemCount: 4,
                  //       ),
                  //     );
                  //   },
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Category".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Bebas",
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CategoriesScreen(),
                            ),
                          );
                        },
                        child: const Text("See all",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('categories')
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Shimmer loading placeholder while data is being fetched
                        return SizedBox(
                          height: 110,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            // Example number of shimmer items
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      width: 60,
                                      height: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Error loading categories'));
                      }
                      if (snapshot.hasData && snapshot.data != null) {
                        final categories = snapshot.data!.docs;

                        return SizedBox(
                          height: 110,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              final category = categories[index].data()
                                  as Map<String, dynamic>;
                              final categoryName = category['categoryName'];
                              final categoryImage = category['categoryImage'];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          CategoriesDetailsScreen(
                                            categoryName: categoryName,
                                          )));
                                },
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: categoryImage,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error, size: 80),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      categoryName,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                          ),
                        );
                      } else {
                        return const Center(child: Text('No categories found'));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Popular Exercise".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Bebas",
                          )),
                      // const Text("See all",
                      //     style: TextStyle(
                      //         fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  FutureBuilder<QuerySnapshot>(
                    future:
                        FirebaseFirestore.instance.collection('exercise').get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Show shimmer effect while waiting for data
                        return ListView.builder(
                          itemCount: 3, // Placeholder item count
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                        );
                      }

                      if (snapshot.hasError) {
                        return const Center(child: Text("Error loading data"));
                      }

                      if (snapshot.hasData) {
                        final exercises = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 15),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            final exercise =
                                exercises[index].data() as Map<String, dynamic>;

                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Use CachedNetworkImage with shimmer placeholder
                                  CachedNetworkImage(
                                    imageUrl: exercise['image'],
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: double.infinity,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
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
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    exercise['title'], // Exercise title
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        "${exercise['level']}  |  ",
                                        // Exercise level
                                        style: const TextStyle(
                                          color: Color(0xFF303841),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.timer_outlined,
                                        size: 12,
                                        color: Color(0xFF00ADB5),
                                      ),
                                      Text(
                                        " ${exercise['duration']} min",
                                        // Exercise duration
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
                        return const Center(child: Text("No data found"));
                      }
                    },
                  ),
                  // ListView.builder(
                  //   itemCount: 2,
                  //   shrinkWrap: true,
                  //   padding: const EdgeInsets.only(top: 15),
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Container(
                  //       margin: const EdgeInsets.only(bottom: 15),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //             ),
                  //             child: Image.asset(
                  //               'assets/images/popular_exercise1.png',
                  //               width: double.infinity,
                  //               height: 190,
                  //               fit: BoxFit.fill,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           const Text(
                  //             "Full Shot Woman Stretching Arm",
                  //             style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.w600),
                  //           ),
                  //           const SizedBox(
                  //             height: 5,
                  //           ),
                  //           const Row(
                  //             children: [
                  //               Text(
                  //                 "Beginner  |  ",
                  //                 style: TextStyle(
                  //                     color: Color(0xFF303841),
                  //                     fontSize: 12,
                  //                     fontWeight: FontWeight.w400),
                  //               ),
                  //               Icon(
                  //                 Icons.timer_outlined,
                  //                 size: 12,
                  //                 color: Color(0xFF00ADB5),
                  //               ),
                  //               Text(
                  //                 " 15 min",
                  //                 style: TextStyle(
                  //                     color: Color(0xFF303841),
                  //                     fontSize: 12,
                  //                     fontWeight: FontWeight.w400),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Meal Plans".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Bebas",
                          )),
                    ],
                  ),
                  FutureBuilder<QuerySnapshot>(
                    future:
                        FirebaseFirestore.instance.collection('meals').get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Show a shimmer loading effect while waiting for the data
                        return ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                        );
                      }

                      if (snapshot.hasError) {
                        return const Center(child: Text("Error loading data"));
                      }

                      if (snapshot.hasData) {
                        final meals = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 15),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            final meal =
                                meals[index].data() as Map<String, dynamic>;

                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MealPlanDetailsScreen(
                                          mealData: meal,
                                        )));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Use CachedNetworkImage for image loading with caching
                                    CachedNetworkImage(
                                      imageUrl: meal['image'],
                                      imageBuilder: (context, imageProvider) =>
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
                                        highlightColor: Colors.grey[100]!,
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
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      meal['title'], // Meal title
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          "${meal['category']}  |  ",
                                          // Meal category
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
                                          // Calories info
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
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text("No data found"));
                      }
                    },
                  ),

                  Divider(
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Additional Exercise".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Bebas",
                          )),
                      // const Text("See all",
                      //     style: TextStyle(
                      //         fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  FutureBuilder<QuerySnapshot>(
                    future:
                        FirebaseFirestore.instance.collection('exercise').get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return const Center(child: Text("Error loading data"));
                      }

                      if (snapshot.hasData) {
                        final exercises = snapshot.data!.docs;
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 15),
                          itemBuilder: (context, index) {
                            final exercise =
                                exercises[index].data() as Map<String, dynamic>;

                            return Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    exercise['image'],
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      exercise['title'],
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/fire.png',
                                          width: 13,
                                        ),
                                        Text(
                                          '  ${exercise['calories']} kcal  |  ',
                                          style: const TextStyle(
                                              color: Color(0xFF3A4750),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Image.asset(
                                          'assets/icons/clock.png',
                                          width: 13,
                                        ),
                                        Text(
                                          ' ${exercise['duration']} min',
                                          style: const TextStyle(
                                              color: Color(0xFF3A4750),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${exercise['level']}',
                                      style: const TextStyle(
                                          color: Color(0xFF3A4750),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey[300]!,
                            );
                          },
                          itemCount: 4,
                        );
                        return ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 15),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            final exercise =
                                exercises[index].data() as Map<String, dynamic>;

                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 190,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(exercise['image']),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    // child: Image.network(
                                    //   exercise['image'],
                                    //   // Load image from Firestore
                                    //   width: double.infinity,
                                    //   height: 190,
                                    //   fit: BoxFit.fill,
                                    // ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    exercise['title'], // Exercise title
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        "${exercise['level']}  |  ",
                                        // Exercise level
                                        style: const TextStyle(
                                            color: Color(0xFF303841),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Icon(
                                        Icons.timer_outlined,
                                        size: 12,
                                        color: Color(0xFF00ADB5),
                                      ),
                                      Text(
                                        " ${exercise['duration']}", // Duration
                                        style: const TextStyle(
                                            color: Color(0xFF303841),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text("No data found"));
                      }
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
