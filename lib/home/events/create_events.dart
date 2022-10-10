import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasky/const.dart';
import 'package:tasky/db/db_functions/events_db.dart';
import 'package:tasky/db/model/events_model.dart';

void createEvents(BuildContext context) {
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
                        'Create Event ',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final events = EventsModel(
                                  dueDate: selectedDate,
                                  time: selectedTime.toString(),
                                  snooze: 1,
                                  title: controller.text);

                              EventsDb.addEvents(events);
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
                              : 'Please Enter a events name';
                        },
                        onFieldSubmitted: (_) {
                          formKey.currentState!.validate();
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          border: InputBorder.none,
                          hintText: 'New event',
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
////

                      GestureDetector(
                        onTap: () async {
                          final TimeOfDay? result = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (result != null) {
                            setState(() {
                              selectedTime = result.format(context);
                            });
                          }
                        },
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
                                  'Due Time',
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
                                      Icons.punch_clock_rounded,
                                      color: Color.fromARGB(255, 46, 97, 253),
                                      size: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        selectedTime.toString(),
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
                      ),

                      ///
                      GestureDetector(
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
                      ),
                    ],
                  ),
                  // Card(
                  //   color: Colors.white,
                  //   surfaceTintColor: Colors.white,
                  //   elevation: 7,
                  //   shadowColor: const Color.fromARGB(255, 157, 157, 157)
                  //       .withOpacity(0.2),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 20, vertical: 10),
                  //     child: DropdownButton<String>(
                  //         icon: const Icon(
                  //           Icons.snooze_rounded,
                  //           color: Color.fromARGB(255, 46, 97, 253),
                  //         ),
                  //         // underline: null,
                  //         borderRadius: BorderRadius.circular(15),
                  //         elevation: 8,
                  //         hint: const Text(
                  //           "Snooze ",
                  //           style: TextStyle(
                  //               color: Color.fromARGB(255, 0, 0, 0),
                  //               fontSize: 13,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //         value: selectedCategory,
                  //         items: snoozList.map(buildMenuItem).toList(),
                  //         onChanged: (value) {
                  //           setState(() {
                  //             selectedCategory = value;
                  //           });
                  //         }),
                  //   ),
                  // ),
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
  // Future<void> _show() async {
  //   final TimeOfDay? result =
  //       await showTimePicker(context: context, initialTime: TimeOfDay.now());
  //   if (result != null) {
  //     setState(() {
  //       _selectedTime = result.format(context);
  //     });
  //   }
  // }
  //   Future timePicker() async {
  //   timePicker.pickedTime = (await showTimePicker(
  //           context: context,
  //           initialTime: TimeOfDay.now(),
  //           builder: (context, child) {
  //             return EventsScreen(child!);
  //           })) ??
  //       TimeOfDay.now();
  //   setState(() {
  //     timePicker.updateTime(context);
  //   });
  // }
}

DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}

// // InputBorder customBorder(Color color) {
// //   return OutlineInputBorder(
// //     borderSide: BorderSide(
// //       color: color,
// //       width: 2,
// //     ),
// //   );
// // }
