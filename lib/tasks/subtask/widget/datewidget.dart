import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final Color colorses;
  final String title;
  final String subtitle;
  final IconData iconses;
  const DateWidget({
    Key? key,
    required this.colorses,
    required this.title,
    required this.subtitle,
    required this.iconses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        // width: d,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: colorses,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(iconses),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
