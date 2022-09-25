import 'package:flutter/material.dart';
import 'package:tasky/settings/about_us/about.dart';
import 'package:tasky/const.dart';
import 'package:tasky/settings/personal_info/personal_info.dart';
import 'privacy_policy/privacy_policy.dart';
import 'termsandcondition/terms.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Settings> list = [
      Settings(
        iconses: Icons.person_outline,
        title: 'Personal Info',
        navi: const PersonlaInfo(),
      ),
      Settings(
        iconses: Icons.ios_share,
        title: 'Share App',
        navi: const PersonlaInfo(),
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
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,s
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(subimg),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Hi, Alen Walker',
                      style: TextStyle(
                        fontSize: 18,
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
                        title: Text(list[index].title)),
                  );
                },
                itemCount: list.length,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
