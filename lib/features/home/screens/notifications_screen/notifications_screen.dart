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
      body: ListView.builder(
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: const Text(
              "Daily steps goal completed",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              "15 minute ago",
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
      ),
    );
  }
}
