import 'package:flutter/material.dart';

const subimg = "assets/images/get.png";
const bot = "assets/images/events.png";
const avatar = "assets/images/avatar.jpg";
const mainimg = "assets/images/main.png";
const ssimg = "assets/images/sss.png";
const newbanner = "assets/images/newbanner.jpg";

const box20 = SizedBox(
  height: 10,
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

DateTime selectedDate = DateTime.now();
String? selectedTime = 'select';

List<String> categoryList = [
  "Work",
  "Personal",
  "Whishlist",
  "Project",
  "Goal",
  "Do Soon",
];
List<String> snoozList = [
  '5 Minutes',
  '10 Minutes',
  '15 Minutes',
  '30 Minutes',
  '45 Minutes',
  '1 Hour',
];

String? selectedCategory;
