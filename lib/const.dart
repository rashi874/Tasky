import 'package:flutter/material.dart';

const subimg = "assets/images/get.png";
const bot = "assets/images/get2.png";
const avatar = "assets/images/avatar.jpg";
const mainimg = "assets/images/main.png";

const box20 = SizedBox(
  height: 20,
);
const box40 = SizedBox(
  height: 40,
);

class Person {
  IconData iconses;
  String title;
  String subtitle;
  Person({
    required this.iconses,
    required this.title,
    required this.subtitle,
  });
}

class Settings {
  IconData iconses;
  String title;

  Widget navi;
  Settings({required this.iconses, required this.title, required this.navi});

  set sliderValue(double sliderValue) {}
}
