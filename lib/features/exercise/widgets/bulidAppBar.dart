import 'package:flutter/material.dart';

AppBar buildAppBar(String title, VoidCallback onPressed) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bebas',
      ),
    ),
    centerTitle: true,
    // leading: const Icon(Icons.arrow_back),
    leading: IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back_ios)),
  );
}