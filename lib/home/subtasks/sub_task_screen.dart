import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasky/const.dart';
import 'package:tasky/db/db_functions/subtask_db.dart';
import 'package:tasky/db/db_functions/task_db.dart';
import 'package:tasky/db/model/subtask_model.dart';
import 'package:tasky/home/subtasks/create_subtask.dart';
import 'package:tasky/home/subtasks/subtask_tile.dart';
import 'package:tasky/home/subtasks/widgets/sample_cards.dart';
import '../../db/model/task_model.dart';

class SubTaskScreen extends StatelessWidget {
  const SubTaskScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Taskmodel task;

  @override
  Widget build(BuildContext context) {
    SubTaskDb.getAllSubTask(task);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color.fromARGB(255, 46, 97, 253),
              child: Text(task.title[0].toUpperCase()),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(task.title),
          ],
        ),
        // centerTitle: true,
        // backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    newbanner,
                  ),
                ),
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(21),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    task.detail.toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ),
            box20,
            ValueListenableBuilder(
              valueListenable: SubTaskDb.subTaskListNotifier,
              builder: (BuildContext ctx, List<SubTaskModel> taskList, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    box20,
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " ${task.title} subtasks",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 29, 29, 29),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' (${taskList.length})',
                            style: const TextStyle(
                              // color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    box20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubCards(
                          cardcolor: const Color.fromARGB(255, 255, 255, 255),
                          maincolor: const Color.fromARGB(255, 248, 248, 248),
                          subcolor: const Color.fromARGB(255, 46, 97, 253),
                          subtitle: task.category,
                          title: 'Category',
                          listenable: TaskDB.completedTaskListNotifier,
                          titlecolor: const Color.fromARGB(255, 29, 29, 29),
                        ),
                        SubCards(
                          cardcolor: const Color.fromARGB(255, 255, 255, 255),
                          maincolor: const Color.fromARGB(255, 248, 248, 248),
                          subcolor: const Color.fromARGB(255, 46, 97, 253),
                          subtitle:
                              "  ${DateFormat('dd-MM-yyyy').format(task.date)}",
                          title: 'Due Date',
                          listenable: TaskDB.starredTaskListNotifier,
                          titlecolor: const Color.fromARGB(255, 29, 29, 29),
                        ),
                      ],
                    ),
                    box20,
                    (taskList.isEmpty)
                        ? SizedBox(
                            height: 400,
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
                                  'Please Add SubTasks',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final subTask = taskList[index];
                              return SubTaskTile(
                                subTask: subTask,
                                task: task,
                              );
                            },
                            itemCount: taskList.length,
                          ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createSubTask(context, task);
        },
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
    );
  }
}
