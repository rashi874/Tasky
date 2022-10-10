import 'package:flutter/material.dart';
import 'package:tasky/const.dart';
import 'package:tasky/db/db_functions/events_db.dart';
import 'package:tasky/db/db_functions/subtask_db.dart';
import 'package:tasky/home/settings/about_us/about.dart';
import 'package:tasky/home/settings/share.dart';
import 'package:tasky/home/splashscreen.dart';
import '../../db/db_functions/task_db.dart';
import 'privacy_policy/privacy_policy.dart';
import 'termsandcondition/terms.dart';

class SettingsScreen extends StatelessWidget {
  final String name;
  const SettingsScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Settings> list = [
      Settings(
        iconses: Icons.ios_share,
        title: 'Share App',
        navi: const ShareScreen(),
      ),
      Settings(
        iconses: Icons.apps_outage,
        title: 'Terms  and Condition',
        navi: const TermsandConditions(),
      ),
      Settings(
        iconses: Icons.privacy_tip_sharp,
        title: 'Privacy Policy',
        navi: const PrivacyPolicy(),
      ),
      Settings(
        iconses: Icons.info_outline,
        title: 'About Us',
        navi: const AboutUS(),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(avatar),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => list[index].navi,
                          ),
                        );
                      },
                      leading: Icon(
                        list[index].iconses,
                        size: 28,
                      ),
                      title: Text(list[index].title),
                    ),
                  );
                },
                itemCount: list.length,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 9),
                child: ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Row(
                          children: const [
                            Icon(Icons.restore),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Reset App',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text("Are you sure?"),
                          ],
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            // textColor: Theme.of(context).primaryColor,
                            child: const Text('close'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              TaskDB.reset(1);
                              EventsDb.resetevent(3);
                              SubTaskDb.reset(2);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SplashScreen()),
                              );
                            },
                            // textColor: Theme.of(context).primaryColor,
                            child: const Text('reset'),
                          ),
                        ],
                      ),
                    );
                  },
                  leading: const Icon(
                    Icons.restore_sharp,
                    size: 28,
                  ),
                  title: const Text('Reset App'),
                ),
              )
            ],
          ),
          const Text('version 1.0.0'),
        ],
      ),
    );
  }
}
