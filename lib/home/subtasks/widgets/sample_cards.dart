// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SubCards extends StatelessWidget {
  final title;
  final subtitle;
  final maincolor;
  final subcolor;
  final cardcolor;
  final listenable;
  final titlecolor;

  const SubCards({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.maincolor,
    required this.subcolor,
    required this.cardcolor,
    required this.listenable,
    required this.titlecolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardcolor,
      surfaceTintColor: Colors.white,
      elevation: 7,
      shadowColor: const Color.fromARGB(255, 157, 157, 157).withOpacity(0.2),
      child: SizedBox(
        width: 180,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: titlecolor,
                      ),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 9,
                      color: titlecolor,
                    ),
                  ),
                ],
              ),
              // Image.asset(
              //   ssimg,
              //   height: 60,
              // )
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: maincolor,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.compass_calibration,
                      color: subcolor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
