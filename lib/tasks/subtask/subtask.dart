import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tasky/db/models/sub_task/subtask_model.dart';
import 'package:tasky/tasks/subtask/widget/completedtask.dart';
import 'package:tasky/tasks/subtask/widget/datewidget.dart';
import 'package:tasky/tasks/subtask/widget/subtask_float.dart';

import '../../db/function/subtask/subtask_db.dart';
import '../../widgets/topbanner.dart';

// ignore: must_be_immutable
class VocabTask extends StatelessWidget {
  final String heading;
  dynamic dates;
  final String descriptionvocab;
  VocabTask(
      {Key? key,
      this.dates,
      required this.descriptionvocab,
      required this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubTaskDB.instance.refresh();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBanner(
                colorses:
                    const Color.fromARGB(255, 242, 242, 242).withOpacity(.6),
                title: 'Description',
                subtitle: descriptionvocab,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DateWidget(
                          colorses: const Color.fromARGB(121, 248, 249, 246)
                              .withOpacity(.6)
                              .withOpacity(.3),
                          iconses: (Icons.date_range),
                          subtitle: "${dates.day}-${dates.month}-${dates.year}",
                          title: 'Due Date',
                        ),
                        DateWidget(
                          colorses: const Color.fromARGB(121, 248, 249, 246)
                              .withOpacity(.6)
                              .withOpacity(.3),
                          iconses: (Icons.toc_sharp),
                          subtitle: '2 pending',
                          title: 'Pending Tasks',
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CompletedTask()),
                      ),
                      child: DateWidget(
                        colorses: const Color.fromARGB(197, 103, 194, 255)
                            .withOpacity(.2),
                        iconses: (Icons.done_all_rounded),
                        subtitle: '2 completed',
                        title: 'Completed Tasks',
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Pending Tasks',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const PendingTaskWidgets(),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Completed Tasks',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const CompletedTask(),
            ],
          ),
        ),
      ),
      floatingActionButton: const FoatingtasksSub(),
    );
  }
}

class PendingTaskWidgets extends StatelessWidget {
  const PendingTaskWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: SubTaskDB.instance.SubtaskListNotifier,
      builder:
          (BuildContext context, List<SubTaskmodel> sublist, Widget? child) {
        return ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final data = sublist[index];
            return Slidable(
              //  key: Key(_value.id!),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (ctx) {
                      // TransactionDB.instance.deleteTransaction(_value.id!);
                    },
                    icon: Icons.done_all_rounded,
                    label: 'Completed',
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  tileColor:
                      const Color.fromARGB(255, 242, 242, 242).withOpacity(.6),
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.access_time_filled_sharp,
                        size: 40,
                        color: const Color.fromARGB(197, 103, 147, 213)
                            .withOpacity(.7),
                      ),
                    ),
                  ),
                  title: Text(
                    data.title,
                    style: const TextStyle(fontSize: 15),
                  ),
                  subtitle: const Text(
                    'pending',
                    style: TextStyle(fontSize: 11),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      SubTaskDB.instance.deleteSubTask(data.id!);
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline_rounded,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: sublist.length,
        );
      },
    );
  }
}
