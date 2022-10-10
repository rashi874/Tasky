import 'package:flutter/material.dart';
import 'package:tasky/const.dart';
import 'package:tasky/home/events/events.dart';

class EventsBanner extends StatelessWidget {
  const EventsBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EventsScreen()),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color:
                    const Color.fromARGB(255, 210, 210, 210).withOpacity(0.2)),
            borderRadius: BorderRadius.circular(17)),
        color: const Color.fromARGB(255, 255, 255, 255),
        surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 7,
        shadowColor: const Color.fromARGB(255, 157, 157, 157).withOpacity(0.2),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadiusDirectional.circular(20),
        // ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20),
          ),
          // tileColor: Colors.blue[500],
          leading: const CircleAvatar(
            radius: 25,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            backgroundImage: AssetImage(subimg),
          ),
          title: const Text(
            'All Events',
            style: TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 80, 80, 80),
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            'View all Events list ',
            style: TextStyle(
              fontSize: 11,
              color: Color.fromARGB(255, 46, 97, 253),
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_rounded,
            color: Color.fromARGB(255, 46, 97, 253),
          ),
        ),
      ),
    );
  }
}
