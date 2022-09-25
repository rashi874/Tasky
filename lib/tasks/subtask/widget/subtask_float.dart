import 'package:flutter/material.dart';
import 'package:tasky/tasks/subtask/subtask.dart';

import '../../../db/function/subtask/subtask_db.dart';
import '../../../db/models/sub_task/subtask_model.dart';
import '../../../home/widgets/add_categories/widget/floatwidget.dart';

class FoatingtasksSub extends StatefulWidget {
  const FoatingtasksSub({
    Key? key,
  }) : super(key: key);

  @override
  State<FoatingtasksSub> createState() => _FoatingtasksSubState();
}

class _FoatingtasksSubState extends State<FoatingtasksSub> {
  late final subtasktitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(20),
                contentTextStyle: const TextStyle(fontSize: 12),
                title: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextformfieldCustom(
                        titles: 'Sub-Task Title',
                        controllers: subtasktitleController,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: (() {
                            saved();
                          }),
                          child: const Text('save'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: const Icon(
        Icons.add,
        size: 28,
      ),
    );
  }

  saved() {
    final subtaskes = SubTaskmodel(
      title: subtasktitleController.text.trim(),
    );

    subtasktitleController.clear();
    SubTaskDB.instance.addSubTask(subtaskes);
    SubTaskDB.instance.refresh();

    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => VocabTask(
          dates: null,
          descriptionvocab: '',
          heading: 'null',
        ),
      ),
    );
  }
}
