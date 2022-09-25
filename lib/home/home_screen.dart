import 'package:flutter/material.dart';
import 'package:tasky/const.dart';
import 'package:tasky/db/function/task/task_db.dart';
import 'package:tasky/home/widgets/all_events_banner.dart';

import 'package:tasky/home/widgets/premium_banner.dart';
import 'package:tasky/home/widgets/task_caregories.dart';
import 'package:tasky/search/search.dart';
import 'package:tasky/settings/settings.dart';

import 'widgets/add_categories/float_main_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TaskDb.getAllTask();
    String sLabel = 'search';
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage(subimg),
            ),
          ),
        ),
        title: Material(
          elevation: 1.5,
          shadowColor: const Color.fromARGB(121, 137, 137, 137),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: TextFormField(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Search()),
              );
            },
            keyboardType: TextInputType.none,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.all(10),
              border: InputBorder.none,
              hintText: sLabel,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              box40,
              Center(
                child: Image.asset(
                  subimg,
                  fit: BoxFit.fitHeight,
                  height: 220,
                  alignment: Alignment.center,
                ),
              ),
              Column(
                children: const [
                  PremiumBanner(),
                  AllEventsBanner(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Task Categories',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  TaskCategories(),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const FloatMainbutton(
        id: '',
      ),
    );
  }
}
