import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MealPlanDetailsScreen extends StatefulWidget {
  const MealPlanDetailsScreen({super.key, required this.mealData});

  final Map<String, dynamic> mealData;

  @override
  State<MealPlanDetailsScreen> createState() => _MealPlanDetailsScreenState();
}

class _MealPlanDetailsScreenState extends State<MealPlanDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    print(widget.mealData);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.mealData['image'],
                  imageBuilder: (context, imageProvider) => Container(
                    width: double.infinity,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: double.infinity,
                      height: 280,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const SizedBox(
                      height: 280,
                      width: double.infinity,
                      child: Center(child: Icon(Icons.error))),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
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
                Positioned(
                  top: 50,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Title and Nutritional Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.mealData['title'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.mealData['description'],
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.local_fire_department,
                              color: Color(0xFF00ADB5),
                              size: 20,
                            ),
                            const SizedBox(width: 6),
                            Text(widget.mealData['calories'].toString()),
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
                        child: Row(
                          children: [
                            const Icon(
                              Icons.timer_sharp,
                              color: Color(0xFF00ADB5),
                              size: 20,
                            ),
                            const SizedBox(width: 6),
                            Text(widget.mealData['duration'].toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Fat",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.mealData['fats'].toString(),
                            style: const TextStyle(
                                color: Color(0xFF3A4750),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Protein",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.mealData['proteins'].toString(),
                            style: const TextStyle(
                                color: Color(0xFF3A4750),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Carbs",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.mealData['carbohydrates'].toString(),
                            style: const TextStyle(
                                color: Color(0xFF3A4750),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "More ${widget.mealData['category']} Meal Plans",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Arial',
                    ),
                  ),
                ],
              ),
            ),
            // Meal Plan List
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('meals')
                  .where('category', isEqualTo: widget.mealData['category'])
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return const Center(child: Text("Error loading data"));
                }

                if (snapshot.hasData) {
                  final meals = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: meals.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final meal = meals[index].data() as Map<String, dynamic>;

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
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
                              // CachedNetworkImage with Shimmer placeholder
                              CachedNetworkImage(
                                imageUrl: meal['image'],
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const SizedBox(
                                        height: 190,
                                        width: double.infinity,
                                        child:
                                            Center(child: Icon(Icons.error))),
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
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No data found"));
                }
              },
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

  const MealPlanItem({
    super.key,
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
