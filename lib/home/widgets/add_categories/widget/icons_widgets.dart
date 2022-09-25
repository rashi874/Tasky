import 'package:flutter/material.dart';

var selectedIcon = Icons.person.codePoint;

class IconsWidgets extends StatefulWidget {
  const IconsWidgets({super.key});

  @override
  State<IconsWidgets> createState() => _IconsWidgetsState();
}

class _IconsWidgetsState extends State<IconsWidgets> {
  final List<int> allIcons = [
    Icons.umbrella_sharp.codePoint,
    Icons.favorite.codePoint,
    Icons.headphones.codePoint,
    Icons.home.codePoint,
    Icons.car_repair.codePoint,
    Icons.settings.codePoint,
    Icons.flight.codePoint,
    Icons.ac_unit.codePoint,
    Icons.run_circle.codePoint,
    Icons.book.codePoint,
    Icons.sports_rugby_rounded.codePoint,
    Icons.alarm.codePoint,
    Icons.call.codePoint,
    Icons.snowing.codePoint,
    Icons.hearing.codePoint,
    Icons.music_note.codePoint,
    Icons.note.codePoint,
    Icons.edit.codePoint,
    Icons.sunny.codePoint,
    Icons.radar.codePoint,

    // add more icons here if you want
  ];

  bool customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: const Text('select an icon'),
        // subtitle: const Text('Leading expansion arrow icon'),
        // controlAffinity: ListTileControlAffinity.leading,
        leading: CircleAvatar(
            child: Icon(
          IconData(
            selectedIcon,
            fontFamily: 'MaterialIcons',
          ),
          color: const Color.fromARGB(216, 57, 57, 57).withOpacity(.5),
        )),
        children: <Widget>[
          SizedBox(
            width: double.maxFinite,
            height: 100,
            // alignment: Alignment.centerRight,
            // This grid view displays all selectable icons
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 50,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemCount: allIcons.length,
              itemBuilder: (_, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color:
                      const Color.fromARGB(215, 196, 196, 196).withOpacity(.2),
                ),
                key: ValueKey(allIcons[index]),
                child: Center(
                  child: IconButton(
                    // give the selected icon a different color
                    color:
                        const Color.fromARGB(216, 57, 57, 57).withOpacity(.6),

                    iconSize: 28,
                    icon: Icon(
                      IconData(
                        allIcons[index],
                        fontFamily: 'MaterialIcons',
                      ),
                    ),
                    onPressed: () {
                      // print(allIcons[index]);

                      setState(
                        () {
                          selectedIcon = allIcons[index];
                        },
                      );
                      // Navigator.of(context).pop(selectedIcon);
                      //  Navigator.pop(context,selectedIcon );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
