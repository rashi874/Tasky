import 'package:flutter/material.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'Activity $index',
                style: const TextStyle(fontSize: 15),
              ),
              subtitle: const Text(
                'completed',
                style: TextStyle(fontSize: 11),
              ),
              // trailing: IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.more_vert_rounded),
              // ),
            ),
          );
        });
  }
}
