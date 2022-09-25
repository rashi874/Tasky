import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/const.dart';
import 'package:tasky/login/login_info.dart';

import '../db/function/task_category/task_category_db.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Categorydb.refresh();

    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tasky',
                    style: GoogleFonts.sniglet(
                        fontSize: 38, fontWeight: FontWeight.w600),
                  ),
                  const Icon(
                    Icons.app_registration,
                    size: 30,
                  )
                ],
              ),
              SizedBox(
                height: 550,
                child: Stack(
                  children: [
                    Positioned(
                      top: 200,
                      height: 350,
                      left: 10,
                      child: Image.asset(
                        subimg,
                        // color: Color.fromARGB(146, 255, 255, 255),
                        // colorBlendMode: BlendMode.modulate,
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      'Welcome',
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Welcome to our  little space, Here you can \nmake yourself  better each day!',
                                        style: TextStyle(
                                          fontSize: 11,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                              // backgroundColor:
                              //     const Color.fromARGB(255, 35, 35, 35),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginInfo()),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
