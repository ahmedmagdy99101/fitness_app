import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories".toUpperCase(),
          style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
              fontFamily: 'Bebas'),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('categories').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Shimmer loading placeholder for GridView while data is being fetched
            return GridView.builder(
              itemCount: 6, // Example number of shimmer items
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 120,
                        height: 120,
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
                        width: 80,
                        height: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              },
            );
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error loading categories'));
          }

          if (snapshot.hasData && snapshot.data != null) {
            final categories = snapshot.data!.docs;

            return GridView.builder(
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                final category =
                    categories[index].data() as Map<String, dynamic>;
                final categoryName = category['categoryName'];
                final categoryImage = category['categoryImage'];

                return Column(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: categoryImage,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, size: 120),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      categoryName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(child: Text('No categories found'));
          }
        },
      ),
    );
  }
}
