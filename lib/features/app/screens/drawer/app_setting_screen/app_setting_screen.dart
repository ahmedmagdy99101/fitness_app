import 'package:fitness_app/shared/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSettingScreen extends StatefulWidget {
  const AppSettingScreen({super.key});

  @override
  State<AppSettingScreen> createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends State<AppSettingScreen> {
  bool healthSwitch = true;
  bool darkSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Setting".toUpperCase(),
          style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
              fontFamily: 'Bebas'),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        children: [
          ListTile(
            title: const Text(
              "Reminder",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            leading: Image.asset(
              "assets/icons/bell.png",
              width: 25,
              height: 25,
            ),
            visualDensity: const VisualDensity(vertical: -3),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            title: const Text(
              "Change Password",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            leading: Image.asset(
              "assets/icons/lock.png",
              width: 25,
              height: 25,
            ),
            visualDensity: const VisualDensity(vertical: -3),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            title: const Text(
              "Apple Health",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            leading: Image.asset(
              "assets/icons/my_favorites.png",
              width: 25,
              height: 25,
            ),
            trailing: CupertinoSwitch(
              value: healthSwitch,
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  healthSwitch = value;
                });
              },
            ),
            visualDensity: const VisualDensity(vertical: -3),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            title: const Text(
              "Dark Mode",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            leading: Image.asset(
              "assets/icons/dark_mode.png",
              width: 25,
              height: 25,
            ),
            trailing: CupertinoSwitch(
              value: darkSwitch,
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  darkSwitch = value;
                });
              },
            ),
            visualDensity: const VisualDensity(vertical: -3),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            title: const Text(
              "Language",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            leading: Image.asset(
              "assets/icons/language.png",
              width: 25,
              height: 25,
            ),
            trailing: const Text(
              "English",
              style: TextStyle(color: Color(0xFF3A4750), fontSize: 12),
            ),
            visualDensity: const VisualDensity(vertical: -3),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15)),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.primaryColor),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
