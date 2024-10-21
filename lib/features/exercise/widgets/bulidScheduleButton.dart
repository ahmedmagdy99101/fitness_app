import 'package:flutter/material.dart';

Widget scheduleButton(String text, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: MaterialButton(
      onPressed: onPressed,
      color:  Colors.black,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(text,
          style: const TextStyle(
            fontFamily: 'Montserrat',
          )),
    ),
  );
}