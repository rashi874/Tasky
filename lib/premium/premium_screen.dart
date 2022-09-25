import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/const.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List premium = [
      'Ads Free',
      'History of Tasks',
      'Assistant',
      'cloud storage',
      'Dark mode',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Premium'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' Premium',
                style: GoogleFonts.sniglet(
                    fontSize: 38, fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                ' 99/year',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          ' Features',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                premium[index],
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            );
                          },
                          itemCount: premium.length,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Try now offer price 89 only'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Image.asset(subimg)
          ],
        ),
      ),
    );
  }
}
