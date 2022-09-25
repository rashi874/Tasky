import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tasky/db/function/task/task_db.dart';
import 'package:tasky/tasks/floating_task.dart';
import 'package:tasky/tasks/subtask/subtask.dart';
import '../db/function/task_category/task_category_db.dart';
import '../db/models/task/task_model.dart';
import '../widgets/topbanner.dart';

class PersonalTaskWidgets extends StatelessWidget {
  final String description;
  final String heading;
  final String id;
  const PersonalTaskWidgets({
    super.key,
    required this.id,
    required this.description,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    // TaskDb.getAllTask();
    // SubTaskDB.instance.refresh();
    return Scaffold(
      appBar: AppBar(
        title: Text(heading),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TopBanner(
                colorses:
                    const Color.fromARGB(255, 242, 242, 242).withOpacity(.6),
                title: 'Description',
                subtitle: description,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Date',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '2022 June 28',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                builder: (BuildContext context, List<Taskmodel> taskList,
                    Widget? child) {
                  TaskDb.getAllTask();
                  TaskDb.refresh();
                  return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      // final taskdata = taskList[index];
                      final taskdata = taskList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          onTap: () {
                            log(taskdata.id.toString());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VocabTask(
                                  dates: taskdata.date,
                                  descriptionvocab: taskdata.descriptionvocab,
                                  heading: taskdata.title,
                                ),
                              ),
                            );
                          },
                          tileColor: const Color.fromARGB(255, 242, 242, 242)
                              .withOpacity(.6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              taskdata.title,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                              194, 39, 105, 248)
                                          .withOpacity(.6),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 1),
                                      child: Text(
                                        '1 left',
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
                                      ),
                                    )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(175, 231, 231, 231),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 1),
                                  child: Text(
                                    '1 Done',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.remove_circle_outline_rounded,
                              size: 25,
                            ),
                            onPressed: () {
                              TaskDb.deleteTask(taskdata.id!);
                            },
                          ),
                        ),
                      );
                    },
                    itemCount: taskList.length,
                  );
                },
                valueListenable: TaskDb.taskListNotifier,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Foatingtasks(),
    );
  }
}

// class TaskList extends StatelessWidget {
//   const TaskList({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
