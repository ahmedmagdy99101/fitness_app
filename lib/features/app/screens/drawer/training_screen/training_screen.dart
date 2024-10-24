import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  String selectedCategory = 'Beginner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TRAINING".toUpperCase(),
          style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
              fontFamily: 'Bebas'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      automaticIndicatorColorAdjustment: true,
                      tabs: const [
                        Tab(text: 'Beginner'),
                        Tab(text: 'Intermediate'),
                        Tab(text: 'Advanced'),
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
                                .collection('exercise')
                                .where('level', isEqualTo: 'Beginner')
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
                                                " ${meal['duration']} min  |  ",
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
                                                " ${meal['calories']} kcal",
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
                                .collection('exercise')
                                .where('level', isEqualTo: 'Intermediate')
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
                                                " ${meal['duration']} min  |  ",
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
                                                " ${meal['calories']} kcal",
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
                                .collection('exercise')
                                .where('level', isEqualTo: 'Advanced')
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
                                                " ${meal['duration']} min |  ",
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
                                                " ${meal['calories']} kcal",
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
            // Row(
            //   children: [
            //     Expanded(
            //       child: TextButton(
            //           onPressed: () {
            //             setState(() {
            //               selectedCategory = 'Beginner';
            //             });
            //           },
            //           style: TextButton.styleFrom(
            //               fixedSize: const Size(38, 60),
            //               backgroundColor: selectedCategory == 'Beginner'
            //                   ? Colors.black
            //                   : Colors.white70,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10))),
            //           child: Text(
            //             'Beginner',
            //             style: TextStyle(
            //               color: selectedCategory == 'Beginner'
            //                   ? Colors.white
            //                   : Colors.black,
            //               fontSize: 14,
            //               fontWeight: FontWeight.w700,
            //             ),
            //           )),
            //     ),
            //     Expanded(
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 2),
            //         child: TextButton(
            //             onPressed: () {
            //               setState(() {
            //                 selectedCategory = 'Intermediate';
            //               });
            //             },
            //             style: TextButton.styleFrom(
            //                 fixedSize: const Size(38, 60),
            //                 backgroundColor: selectedCategory == 'Intermediate'
            //                     ? Colors.black
            //                     : Colors.white70,
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(10))),
            //             child: Text(
            //               'Intermediate',
            //               style: TextStyle(
            //                 color: selectedCategory == 'Intermediate'
            //                     ? Colors.white
            //                     : Colors.black,
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w700,
            //               ),
            //             )),
            //       ),
            //     ),
            //     Expanded(
            //       child: TextButton(
            //           onPressed: () {
            //             setState(() {
            //               selectedCategory = 'Advanced';
            //             });
            //           },
            //           style: TextButton.styleFrom(
            //               fixedSize: const Size(38, 60),
            //               backgroundColor: selectedCategory == 'Advanced'
            //                   ? Colors.black
            //                   : Colors.white70,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10))),
            //           child: Text(
            //             'Advanced',
            //             style: TextStyle(
            //               color: selectedCategory == 'Advanced'
            //                   ? Colors.white
            //                   : Colors.black,
            //               fontSize: 14,
            //               fontWeight: FontWeight.w700,
            //             ),
            //           )),
            //     ),
            //   ],
            // ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 8),
            //   child: Text(
            //     'Popular Training',
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 18,
            //       fontWeight: FontWeight.w600,
            //       fontFamily: 'Montserrat',
            //     ),
            //   ),
            // ),
            // const PopularTrainingWidget(),
            // const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 4),
            //   child: Text(
            //     'Just for you',
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 18,
            //       fontWeight: FontWeight.w600,
            //       fontFamily: 'Montserrat',
            //     ),
            //   ),
            // ),
            // const JustForYouWidget()
          ],
        ),
      ),
    );
  }
}
