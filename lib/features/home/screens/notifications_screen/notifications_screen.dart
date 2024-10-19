import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications".toUpperCase(),
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
        future: FirebaseFirestore.instance.collection('notifications').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Shimmer loading placeholder while data is being fetched
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading categories'));
          }
          if (snapshot.hasData && snapshot.data != null) {
            final notifications = snapshot.data!.docs;

            return ListView.separated(
              itemCount: notifications.length,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    notifications[index]['title'],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    notifications[index]['description'],
                    style: TextStyle(
                        color: Color(0xFF3A4750),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  leading: Image.asset(
                    "assets/images/notifications_icon.png",
                    width: 55,
                    height: 55,
                  ),
                  visualDensity: const VisualDensity(vertical: 3),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
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
