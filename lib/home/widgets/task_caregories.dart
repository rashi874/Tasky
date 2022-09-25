import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasky/const.dart';
import 'package:tasky/db/models/data_model.dart';
import 'package:tasky/tasks/task_widget.dart';
import '../../db/function/task/task_db.dart';
import '../../db/function/task_category/task_category_db.dart';

class TaskCategories extends StatefulWidget {
  const TaskCategories({Key? key}) : super(key: key);

  @override
  State<TaskCategories> createState() => _TaskCategoriesState();
}

class _TaskCategoriesState extends State<TaskCategories> {
  @override
  @override
  Widget build(BuildContext context) {
    // List<Settings> list = [
    //   Settings(
    //     iconses: Icons.person,
    //     title: 'Personal',
    //     navi: const PersonlaInfo(),
    //   ),
    //   Settings(
    //     iconses: Icons.monitor_heart,
    //     title: 'Health',
    //     navi: const PersonlaInfo(),
    //   ),
    //   Settings(
    //     iconses: Icons.work_history,
    //     title: 'Work',
    //     navi: const PersonlaInfo(),
    //   ),
    //   Settings(
    //     iconses: Icons.mode_of_travel,z
    //     navi: const PersonlaInfo(),
    //   ),
    //   Settings(
    //     iconses: Icons.event,
    //     title: '22-12-1198',
    //     navi: const AboutUS(),
    //   ),
    // ];
    return ValueListenableBuilder(
      valueListenable: Categorydb.taskCategoryListNotifier,
      builder: (BuildContext context,
          List<TaskCategorymodel> taskcategoriesList, Widget? child) {
        // Categorydb.getAllTaskCategory();
        return (taskcategoriesList.isEmpty)
            ? Container(
                height: 250,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      mainimg,
                      height: 100,
                    ),
                    const Text('Please add Categories'),
                  ],
                ),
              )
            : ListView.builder(
                // padding: const EdgeInsets.all(5),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,

                // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                //   crossAxisSpacing: 20.0,
                //   mainAxisSpacing: 20.0,
                //   childAspectRatio: 3.2 / 3.2,
                //   maxCrossAxisExtent: 210,
                // ),
                itemBuilder: (context, index) {
                  final data = taskcategoriesList[index];
                  return GestureDetector(
                    onTap: () {
                      log(data.id.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalTaskWidgets(
                            id: data.id.toString(),
                            description: data.description,
                            heading: data.title,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        // tileColor:
                        //     const Color.fromARGB(255, 117, 117, 118).withOpacity(.2),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          child: IconButton(
                            icon: Icon(
                              IconData(
                                data.icon,
                                // fontPackage: 'font_awesome_flutter',
                                fontFamily: 'MaterialIcons',
                              ),
                              color: const Color.fromARGB(255, 103, 156, 247),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        title: Text(
                          taskcategoriesList[index].title,
                          style: const TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          data.sub,
                          style: const TextStyle(fontSize: 13),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Categorydb.deleteTaskCategory(data.id!);
                          },
                          icon: const CircleAvatar(
                            // radius: 12,
                            // backgroundColor: Color.fromARGB(178, 11, 255, 231),
                            child: Icon(
                              Icons.remove_circle_outline_rounded,
                              // color: Color.fromARGB(255, 193, 244, 54),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: taskcategoriesList.length,
              );
      },
    );
  }
}
