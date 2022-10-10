import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tasky/db/db_functions/task_db.dart';
import 'package:tasky/db/model/task_model.dart';
import 'package:tasky/home/subtasks/sub_task_screen.dart';
import 'package:tasky/home/tasks/update_task.dart';
import 'dart:math' as math;

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);
  final Taskmodel task;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubTaskScreen(
              task: task,
            ),
          ),
        );
      },
      child: Slidable(
        // key: const ValueKey(0),
        key: UniqueKey(),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          // dismissible: DismissiblePane(
          //   onDismissed: () {
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext context) {
          //         return AlertDialog(
          //           title: const Text(
          //             'Delete Task!',
          //             style: TextStyle(fontSize: 20),
          //           ),
          //           content: const Text('Do you confirm to delete'),
          //           actions: [
          //             TextButton(
          //               onPressed: () {
          //                 Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => HomeScreen(
          //                               name: '',
          //                             )));
          //               },
          //               child: const Text('Cancel'),
          //             ),
          //             TextButton(
          //               onPressed: () {
          //                 if (task.id == null) {
          //                 } else {
          //                   TaskDB.deleteTask(task.id!);
          //                   log('deleted');
          //                 }
          //                 Navigator.pop(context, 'Delete');
          //               },
          //               child: const Text('Delete'),
          //             ),
          //           ],
          //         );
          //       },
          //     );
          //   },
          // ),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              onPressed: (value) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Delete Task!',
                        style: TextStyle(fontSize: 20),
                      ),
                      content: const Text('Do you confirm to delete'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            if (task.id == null) {
                            } else {
                              TaskDB.deleteTask(task.id!);
                              log('deleted');
                            }
                            Navigator.pop(context, 'Delete');
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              backgroundColor: Color.fromARGB(141, 248, 248, 248),
              foregroundColor: const Color.fromARGB(255, 255, 0, 0),
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              onPressed: (value) {
                task.isStarred = !task.isStarred;
                TaskDB.updateTask(task);
              },
              backgroundColor: Color.fromARGB(141, 248, 248, 248),
              foregroundColor: const Color.fromARGB(248, 41, 41, 41),
              icon: task.isStarred ? Icons.thumb_up : Icons.thumb_down,
              label: 'Favorite',
            ),
          ],
        ),

        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.

              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              onPressed: (value) {
                // task.isCompleted = true;
                updateTask(context, task.id);
                // TaskDB.updateTask(task);
              },
              backgroundColor: Color.fromARGB(141, 248, 248, 248),
              foregroundColor: const Color.fromARGB(255, 38, 38, 38),
              icon: Icons.edit_note_rounded,
              label: 'Edit',
            ),
            SlidableAction(
              flex: 2,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              onPressed: (value) {
                task.isCompleted = true;
                TaskDB.updateTask(task);
              },
              backgroundColor: Color.fromARGB(141, 248, 248, 248),
              foregroundColor: const Color.fromARGB(255, 46, 97, 253),
              icon: Icons.done_all_outlined,
              label: 'complete',
            ),
          ],
        ),

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 7,
          shadowColor:
              const Color.fromARGB(255, 157, 157, 157).withOpacity(0.10),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: const Color.fromARGB(255, 210, 210, 210)
                      .withOpacity(0.2)),
              borderRadius: BorderRadius.circular(17)), //<-- SEE HERE

          child: ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Colors
                  .primaries[math.Random().nextInt(Colors.primaries.length)],
              child: Text(
                parseDate(task.date),
                style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: const Color.fromARGB(255, 235, 235, 235),
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            title: TaskTileText(
              text: task.title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 80, 80, 80),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TaskTileText(
                  text: task.category,
                  fontSize: 12,
                  color: const Color.fromARGB(255, 23, 23, 23),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_rounded),
          ),
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {
    if (task.id == null) {
    } else {
      TaskDB.deleteTask(task.id!);
    }
  }

  String parseDate(DateTime date) {
    final dates = DateFormat.MMMd().format(date).toUpperCase();
    final splitedDate = dates.split(' ');
    return '${splitedDate.last}\n${splitedDate.first}';
  }
}

class TaskTileActions extends StatelessWidget {
  const TaskTileActions({
    Key? key,
    required this.color,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 2,
          //     color: Colors.grey.shade500,
          //   ),
          // ],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Icon(
          icon,
          // color: backgroundColor,
        ),
      ),
    );
  }
}

class TaskTileText extends StatelessWidget {
  const TaskTileText(
      {Key? key,
      required this.text,
      this.fontSize = 14,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black})
      : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
