import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tasky/const.dart';
import 'package:tasky/home/login/login_info.dart';

// const SAVE_KEY_NAME = 'UserLoggedIn';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    studentport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              Image.asset(
                subimg,
                height: 250,
              ),
              SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoadingAnimationWidget.twoRotatingArc(
                        color: const Color.fromARGB(255, 46, 97, 253),
                        size: 30),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'version 1.0.0',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Welcome to our  little space, Here you can \nmake yourself  better each day!',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
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

  Future<void> studentport() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return const LoginInfo();
    }));
  }
}
