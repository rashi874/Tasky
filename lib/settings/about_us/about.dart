import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/const.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About US'),
        elevation: 0,
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          Column(
            children: [
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
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  ' version 1.0.0.1',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              ''' Tasky Con is a simple task manager app that lets you simplify you daily or weekly tasks by Subdiving them and setting a due date will keep you motivated ,and never kets you forget your task. Qw ensure that you are focused and determined in completing your task''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            subimg,
            color: const Color.fromARGB(206, 255, 255, 255),
            colorBlendMode: BlendMode.modulate,
          ),
        ],
      ),
    );
  }
}
