import 'package:flutter/material.dart';
import 'package:tasky/premium/premium_screen.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(233, 178, 214, 239).withOpacity(0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Go Premium!',
                style: TextStyle(fontSize: 17),
              ),
            ),
            const Text(
              'Get unilimated acces\nto all our features',
              style: TextStyle(fontSize: 12),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: ElevatedButton(
                // backgroundColor: const Color.fromARGB(255, 35, 35, 35),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PremiumScreen()),
                  );
                },
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
