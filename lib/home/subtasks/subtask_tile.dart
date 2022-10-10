import 'package:flutter/material.dart';
import 'package:tasky/db/db_functions/subtask_db.dart';
import 'package:tasky/db/db_functions/task_db.dart';
import 'package:tasky/db/model/subtask_model.dart';
import 'package:tasky/db/model/task_model.dart';

class SubTaskTile extends StatefulWidget {
  const SubTaskTile({
    Key? key,
    required this.task,
    required this.subTask,
  }) : super(key: key);

  final Taskmodel task;

  final SubTaskModel subTask;

  @override
  State<SubTaskTile> createState() => _SubTaskTileState();
}

class _SubTaskTileState extends State<SubTaskTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 7,
      shadowColor: const Color.fromARGB(255, 157, 157, 157).withOpacity(0.10),
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: const Color.fromARGB(255, 210, 210, 210).withOpacity(0.2)),
          borderRadius: BorderRadius.circular(17)),
      margin: const EdgeInsets.all(4),
      color: widget.task.isCompleted || widget.subTask.isCompleted
          ? const Color.fromARGB(255, 32, 32, 32).withOpacity(0.3)
          : const Color.fromARGB(255, 255, 255, 255),

      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(20),
      //   border: Border.all(
      //       width: 1,
      //       color: widget.task.isCompleted || widget.subTask.isCompleted
      //           ? const Color.fromARGB(196, 90, 255, 114)
      //           : const Color.fromARGB(161, 243, 243, 243)),
      // ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
        // tileColor: const Color.fromARGB(255, 242, 242, 242).withOpacity(.6),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          value: widget.task.isCompleted || widget.subTask.isCompleted,
          onChanged: (value) {
            setState(() {
              widget.subTask.isCompleted = value!;
            });
            if (widget.task.isCompleted) {
              widget.task.isCompleted = false;
              TaskDB.updateTask(widget.task);
            }
            SubTaskDb.updateSubTask(widget.task, widget.subTask, value!);
          },
        ),
        title: widget.task.isCompleted || widget.subTask.isCompleted
            ? Text(
                widget.subTask.title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 17, 17, 17),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )
            : Text(widget.subTask.title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 46, 97, 253),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  //   decoration: widget.task.isCompleted || widget.subTask.isCompleted
                  //       ?
                  //       Text('completed')
                  //       : null,
                  //   decorationColor: Color.fromARGB(255, 255, 40, 137),
                  //   decorationThickness: 2,
                  // ),
                )),
        subtitle: widget.subTask.detail != null
            ? Text(
                widget.subTask.detail!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  // decoration:
                  //     widget.task.isCompleted || widget.subTask.isCompleted
                  //         ? TextDecoration.lineThrough
                  //         : null,
                  // decorationColor: const Color.fromARGB(255, 0, 0, 0),
                  // decorationThickness: 2,
                ),
              )
            : null,
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 46, 97, 253),
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Delete SubTask!',
                          style: TextStyle(fontSize: 19),
                        ),
                        content: const Text('Do you confirm to delete'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              if (widget.subTask.id != null) {
                                SubTaskDb.deleteSubTask(
                                    widget.task, widget.subTask.id!);
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
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
          ),
        ),
      ),
    );
  }
}
