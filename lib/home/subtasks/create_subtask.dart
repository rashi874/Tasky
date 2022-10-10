import 'package:flutter/material.dart';
import 'package:tasky/db/db_functions/subtask_db.dart';
import 'package:tasky/db/model/subtask_model.dart';
import 'package:tasky/db/model/task_model.dart';

void createSubTask(BuildContext context, Taskmodel task) {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      builder: (ctx) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            // padding: EdgeInsets.fromLTRB(
            //     10, 10, 10, MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.all(12),
              height: 290,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          icon: const Icon(
                            Icons.close,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          'Create SubTask',
                          style: TextStyle(fontSize: 17),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                SubTaskModel subTask = SubTaskModel(
                                  title: titleController.text,
                                  detail: detailsController.text,
                                  isCompleted: false,
                                );

                                SubTaskDb.addSubTask(task, subTask);
                                Navigator.pop(ctx);
                              }
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                // color: backgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                    Form(
                      key: formKey,
                      child: Material(
                        color: const Color.fromARGB(186, 207, 207, 209)
                            .withOpacity(.2),
                        // elevation: 1.5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),

                        child: TextFormField(
                          controller: titleController,
                          validator: (value) {
                            return value!.trim().isNotEmpty
                                ? null
                                : 'Enter a task title';
                          },
                          onFieldSubmitted: (_) {
                            formKey.currentState!.validate();
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            border: InputBorder.none,
                            hintText: 'Title',
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 30),
                    Material(
                      color: const Color.fromARGB(186, 207, 207, 209)
                          .withOpacity(.2),
                      // elevation: 1.5,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: TextFormField(
                        controller: detailsController,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          border: InputBorder.none,
                          hintText: 'Description',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      });
}

InputBorder customBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 2,
    ),
  );
}
