import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tasky/tasks/task_widget.dart';
import '../db/function/task/task_db.dart';
import '../db/models/task/task_model.dart';
import '../home/widgets/add_categories/widget/float_description.dart';
import '../home/widgets/add_categories/widget/floatwidget.dart';

DateTime? news;

class Foatingtasks extends StatelessWidget {
  Foatingtasks({
    super.key,
  });

  final tasktitleController = TextEditingController();

  final taskdescriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.all(12),
                height: 350,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.min,
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
                              'Create Task ',
                              style: TextStyle(fontSize: 18),
                            ),
                            ElevatedButton(
                                child: const Text('save'),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                    final taskes = Taskmodel(
                                      title: tasktitleController.text.trim(),
                                      descriptionvocab:
                                          taskdescriptionController.text.trim(),
                                      date: _date,
                                    );
                                    log('$taskes.id');
                                    TaskDb.addTask(taskes);
                                    TaskDb.getAllTask();
                                    TaskDb.refresh();
                                    Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PersonalTaskWidgets(
                                          description: '',
                                          heading: '',
                                          id: '1',
                                        ),
                                      ),
                                    );
                                    tasktitleController.clear();
                                    taskdescriptionController.clear();
                                  }
                                  // tasksSave();
                                }),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                TextformfieldCustom(
                                  titles: 'Task Title',
                                  controllers: taskdescriptionController,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    DateWidgets(),
                                    PriorityWidget(),
                                  ],
                                ),
                                TextfieldCustomDescriprion(
                                  titles: 'Description',
                                  controllers: tasktitleController,
                                ),
                                // Center(
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(8.0),
                                //     child:
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: const Icon(
        Icons.add,
        size: 28,
      ),
    );
  }
}

var _dropDownValue = 'select';

class PriorityWidget extends StatefulWidget {
  const PriorityWidget({super.key});

  @override
  State<PriorityWidget> createState() => _PriorityWidgetState();
}

class _PriorityWidgetState extends State<PriorityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      // width: double.maxFinite,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color.fromARGB(255, 241, 241, 241),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment:
        //     CrossAxisAlignment.start,
        children: [
          const Text(
            'Priority',
            style: TextStyle(fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(12),
              // menuMaxHeight: 2,
              hint: Text(
                _dropDownValue,
                style: TextStyle(
                  color:
                      const Color.fromARGB(194, 39, 105, 248).withOpacity(.6),
                ),
              ),
              icon: const Icon(Icons.toc_sharp),
              items: <String>['Easy', 'Medium', 'Hard'].map((String values) {
                return DropdownMenuItem<String>(
                  value: values,
                  child: Text(values),
                );
              }).toList(),

              onChanged: (values) {
                setState(() {
                  _dropDownValue = values!;
                });

                log('$values');
              },
            ),
          ),
        ],
      ),
    );
  }
}

DateTime _date = DateTime(2020, 11, 17);

class DateWidgets extends StatefulWidget {
  const DateWidgets({super.key});

  @override
  State<DateWidgets> createState() => _DateWidgetsState();
}

class _DateWidgetsState extends State<DateWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () async {
          final DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: _date,
            firstDate: DateTime(2017, 1),
            lastDate: DateTime(2022, 7),
            helpText: 'Select a date',
          );
          if (newDate != null) {
            setState(() {
              _date = newDate;
            });
          }
        },
        child: Container(
          padding: const EdgeInsets.all(15.0),
          // width: d,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: const Color.fromARGB(194, 39, 105, 248).withOpacity(.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Date',
                style: TextStyle(fontSize: 12),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Icon(Icons.date_range_outlined),
                  ),
                  Text(
                    "${_date.day} -${_date.month} -${_date.year}",
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
