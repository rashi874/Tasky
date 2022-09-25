import 'package:flutter/material.dart';
import 'package:tasky/const.dart';


class PersonlaInfo extends StatelessWidget {
  const PersonlaInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Person> list = [
      Person(
        iconses: Icons.mark_email_unread,
        title: 'Email',
        subtitle: 'Alanwalker2@gmail.com',
      ),
      Person(
        iconses: Icons.edgesensor_high,
        title: 'Number',
        subtitle: '8138078337',
      ),
      Person(
        iconses: Icons.settings_accessibility,
        title: 'Gender',
        subtitle: 'Male',
      ),
      Person(
        iconses: Icons.mode_of_travel,
        title: 'Place',
        subtitle: 'Delsona',
      ),
      Person(
        iconses: Icons.event,
        title: 'Date of Birth',
        subtitle: '22-12-1198',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Info'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(subimg), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(168, 136, 201, 244)
                        .withOpacity(.6),
                  ),
                ),
                const Positioned(
                  left: 80,
                  top: 80,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 37, 94, 250),
                    child: Icon(Icons.edit),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                ' Alen Walker',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      leading: Icon(
                        list[index].iconses,
                        size: 28,
                      ),
                      title: Text(list[index].title),
                      subtitle: Text(list[index].subtitle),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
