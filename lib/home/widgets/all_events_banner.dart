import 'package:flutter/material.dart';
import 'package:tasky/const.dart';
import 'package:tasky/events/events.dart';

class AllEventsBanner extends StatelessWidget {
  const AllEventsBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EventsScreen()),
          );
        },
        // tileColor: const Color.fromARGB(222, 66, 255, 63).withOpacity(0.10),
        leading: CircleAvatar(
          radius: 25,
          child: Image.asset(
            mainimg,
            // height: 150,
            color: const Color.fromARGB(223, 255, 255, 255),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
        title: const Text(
          'All Events',
          style: TextStyle(fontSize: 18),
        ),
        subtitle: const Text(
          'View all Events list ',
          style: TextStyle(fontSize: 11),
        ),
        trailing: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
