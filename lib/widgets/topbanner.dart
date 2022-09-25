import 'package:flutter/material.dart';
import 'package:tasky/const.dart';

class TopBanner extends StatelessWidget {
  final Color colorses;
  final String title;
  final String subtitle;
  const TopBanner({
    Key? key,
    required this.colorses,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colorses,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 1,
            left: 240,
            child: SizedBox(
              height: 200,
              child: Center(
                child: Image.asset(
                  mainimg,
                  fit: BoxFit.cover,
                  height: 50,
                  // alignment: Alignment.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
