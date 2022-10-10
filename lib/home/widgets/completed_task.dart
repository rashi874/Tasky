import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tasky/const.dart';
import 'package:tasky/db/model/task_model.dart';
import 'package:tasky/home/tasks/task_tile.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({Key? key, required this.listenable}) : super(key: key);

  final ValueListenable<List<Taskmodel>> listenable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('completed Tasks'),
      ),
      body: ValueListenableBuilder(
          valueListenable: listenable,
          builder: (BuildContext ctx, List<Taskmodel> taskList, _) {
            return (taskList.isEmpty)
                ? Center(
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
                  );
          }),
    );
  }
}
