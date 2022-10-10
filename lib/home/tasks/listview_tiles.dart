import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tasky/const.dart';
import 'package:tasky/home/tasks/task_tile.dart';
import '../../db/model/task_model.dart';

class Listviewtile extends StatelessWidget {
  const Listviewtile({Key? key, required this.listenable}) : super(key: key);

  final ValueListenable<List<Taskmodel>> listenable;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: listenable,
        builder: (BuildContext ctx, List<Taskmodel> taskList, _) {
          return Column(
            children: [
              box20,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pending Tasks',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 80, 80, 80)),
                    ),
                    box20,
                    Text(
                      '(${taskList.length})',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 80, 80, 80)),
                    ),
                  ],
                ),
              ),
              (taskList.isEmpty)
                  ? SizedBox(
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              mainimg,
                              height: 80,
                            ),
                          ),
                          const Text(
                            'Please Add Tasks',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TaskTile(
                          task: taskList[index],
                        );
                      },
                      itemCount: taskList.length,
                    ),
            ],
          );
        });
  }
}
