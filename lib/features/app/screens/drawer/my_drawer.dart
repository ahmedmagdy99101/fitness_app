import 'package:fitness_app/features/app/screens/drawer/training_screen/training_screen.dart';
import 'package:flutter/material.dart';

import '../../../../shared/app_colors.dart';
import '../../../home/screens/categories_screen/categories_screen.dart';
import 'app_setting_screen/app_setting_screen.dart';
import 'favorites_screen/favorites_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const DrawerHeader(
              child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  'assets/images/avatar.png',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Salma Ahmed",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Beginner",
                style: TextStyle(
                    color: Color(0xFF303841),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )),
          // plans
          BuildDrawerItemWidget(
            itemName: 'Plans',
            itemIcon: 'assets/icons/plans_icon.png',
            onTap: () {},
          ),
          const Divider(),
          // plans
          BuildDrawerItemWidget(
            itemName: 'Training',
            itemIcon: 'assets/icons/training.png',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const TrainingScreen()));
            },
          ),
          const Divider(),
          BuildDrawerItemWidget(
            itemName: 'Categories',
            itemIcon: 'assets/icons/categories.png',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const CategoriesScreen(),
                ),
              );
            },
          ),
          const Divider(),
          BuildDrawerItemWidget(
            itemName: 'My Account',
            itemIcon: 'assets/icons/my_account.png',
            onTap: () {},
          ),
          const Divider(),
          BuildDrawerItemWidget(
            itemName: 'My Favorites',
            itemIcon: 'assets/icons/my_favorites.png',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const MyFavouritesScreen()));
            },
          ),
          const Divider(),
          BuildDrawerItemWidget(
            itemName: 'App Settings',
            itemIcon: 'assets/icons/app_settings.png',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const AppSettingScreen()));
            },
          ),
          const Divider(),
          BuildDrawerItemWidget(
            itemName: 'Contact Support',
            itemIcon: 'assets/icons/contact_support.png',
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          // ListView.separated(itemBuilder: (BuildContext context, int index) {
          //   return BuildDrawerItemWidget(
          //     itemName: 'Plans',
          //     itemIcon: 'assets/icons/plans_icon.png',
          //     onTap: () {  },
          //   );
          // }, separatorBuilder: (BuildContext context, int index) {
          //   return const Divider();
          // }, itemCount: 10, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),),
        ],
      ),
    );
  }
}

class BuildDrawerItemWidget extends StatelessWidget {
  const BuildDrawerItemWidget(
      {super.key,
      required this.itemName,
      required this.itemIcon,
      required this.onTap});

  final String itemName;
  final String itemIcon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        itemName,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      leading: Image.asset(
        itemIcon,
        width: 25,
        height: 25,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: AppColors.primaryColor,
        size: 17,
      ),
      visualDensity: const VisualDensity(vertical: -3),
    );
  }
}
