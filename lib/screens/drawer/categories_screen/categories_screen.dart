import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories".toUpperCase(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
              fontFamily: 'Bebas'),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ClipOval(
                child: Image.asset(
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  'assets/images/category1.png',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Yoga",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          );
        },
      ),
    );
  }
}
