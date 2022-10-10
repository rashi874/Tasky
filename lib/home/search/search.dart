import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasky/const.dart';
import 'package:tasky/db/db_functions/task_db.dart';
import 'package:tasky/db/model/task_model.dart';
import 'package:tasky/home/subtasks/sub_task_screen.dart';
import 'package:tasky/home/tasks/task_tile.dart';
import 'dart:math' as math;

class Search extends StatefulWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  // final ValueListenable<List<Taskmodel>> listenable;

  @override
  State<Search> createState() => _SearchState();
}

List _foundUsers = [];

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TaskDB.pendingTaskListNotifier,
      builder: (BuildContext ctx, List<Taskmodel> taskList, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Material(
              elevation: 1.5,
              shadowColor: const Color.fromARGB(121, 137, 137, 137),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: TextFormField(
                autofocus: true,
                onChanged: (value) {
                  List results = [];
                  if (value.isEmpty) {
                    // if the search field is empty or only contains white-space, we'll display all users
                    results = taskList;
                  } else {
                    results = taskList
                        .where((user) => user.title
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                    // we use the toLowerCase() method to make it case-insensitive
                  }

                  // Refresh the UI
                  setState(
                    () {
                      _foundUsers = results;
                      // log(_foundUsers.length.toStrihng(
                    },
                  );
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.all(14),
                  border: InputBorder.none,
                  // hintText: "Search by Events and tasks ",
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: _foundUsers.isEmpty
                    ? SizedBox(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                mainimg,
                                height: 100,
                              ),
                            ),
                            const Text(
                              'No results found',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          box20,
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: _foundUsers.length,
                              itemBuilder: (context, index) {
                                final task = taskList[index];
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
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.primaries[
                                          math.Random().nextInt(
                                              Colors.primaries.length)],
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        parseDate(task.date).toString(),
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ),
                                    title: TaskTileText(
                                      text: task.title,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 80, 80, 80),
                                    ),
                                    subtitle: TaskTileText(
                                        text: task.category,
                                        fontSize: 13,
                                        color: const Color.fromARGB(
                                            255, 23, 23, 23)),
                                    trailing:
                                        const Icon(Icons.arrow_forward_rounded),
                                  ),
                                );
                              }),
                        ],
                      )),
          ),
        );
      },
    );
  }

  String parseDate(DateTime date) {
    final dates = DateFormat.MMMd().format(date).toUpperCase();
    final splitedDate = dates.split(' ');
    return '${splitedDate.last}\n${splitedDate.first}';
  }
}
