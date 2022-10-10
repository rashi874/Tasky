import 'package:flutter/material.dart';
import 'package:tasky/const.dart';
import 'package:tasky/db/db_functions/task_db.dart';
import 'package:tasky/db/model/task_model.dart';
import 'package:intl/intl.dart';

void updateTask(BuildContext context, id) {
  TextEditingController controller = TextEditingController();
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
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            // padding: EdgeInsets.fromLTRB(
            //     10, 10, 10, MediaQuery.of(context).viewInsets.bottom),
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.all(12),
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        'Update Task ',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Taskmodel task = Taskmodel(
                                date: selectedDate,
                                title: controller.text,
                                category: selectedCategory ?? "Do Soon",
                                detail: detailsController.text,
                              );

                              TaskDB.editTask(task, id);
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
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: TextFormField(
                        controller: controller,
                        validator: (value) {
                          return value!.trim().isNotEmpty
                              ? null
                              : 'Enter a task name';
                        },
                        onFieldSubmitted: (_) {
                          formKey.currentState!.validate();
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          border: InputBorder.none,
                          hintText: 'New Task',
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        elevation: 7,
                        shadowColor: const Color.fromARGB(255, 157, 157, 157)
                            .withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: DropdownButton<String>(
                              icon: const Icon(
                                Icons.safety_check,
                                color: Color.fromARGB(255, 46, 97, 253),
                              ),
                              underline: null,
                              borderRadius: BorderRadius.circular(15),
                              elevation: 8,
                              hint: const Text(
                                "Category ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: selectedCategory,
                              items: categoryList.map(buildMenuItem).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value;
                                });
                              }),
                        ),
                      ),
                      GestureDetector(
                        child: Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          elevation: 7,
                          shadowColor: const Color.fromARGB(255, 157, 157, 157)
                              .withOpacity(0.2),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Due Date',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.calendar_month_outlined,
                                      color: Color.fromARGB(255, 46, 97, 253),
                                      size: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        DateFormat('dd-MM-yyyy')
                                            .format(selectedDate),
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 12, 12, 12),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null) {
                            return;
                          } else {
                            setState(() {
                              selectedDate = newDate;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  Material(
                    color: const Color.fromARGB(186, 207, 207, 209)
                        .withOpacity(.2),
                    // elevation: 1.5,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: TextFormField(
                      controller: detailsController,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        border: InputBorder.none,
                        hintText: 'Description',
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}
