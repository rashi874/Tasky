import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:tasky/db/models/data_model.dart';

const taskCategoryDBname = 'taskCategory-db';

// // abstract class TaskCategoryDbFunctions {
// //   Future<void> addTaskCategory(TaskCategorymodel obj);
// //   Future<List<TaskCategorymodel>> getAllTaskCategory();
// //   Future<void> deleteTaskCategory(String id);
// // }

// class TaskCategoryDB implements TaskCategoryDbFunctions {
//   // TaskCategoryDB.internal();

//   // static TaskCategoryDB instance = TaskCategoryDB.internal();

//   // factory TaskCategoryDB() {
//   //   return instance;
//   // }

// }

class Categorydb {
  static ValueNotifier<List<TaskCategorymodel>> taskCategoryListNotifier =
      ValueNotifier([]);

  @override
  static Future<void> addTaskCategory(TaskCategorymodel obj) async {
    final db = await Hive.openBox<TaskCategorymodel>(taskCategoryDBname);
    await db.put(obj.id, obj);
  }

  static Future<void> refresh() async {
    final list = await getAllTaskCategory();
    // list.sort((first, second) => second.date.compareTo(first.date));
    taskCategoryListNotifier.value.clear();
    taskCategoryListNotifier.value.addAll(list);
    taskCategoryListNotifier.notifyListeners();
  }

  @override
  static Future<List<TaskCategorymodel>> getAllTaskCategory() async {
    final db = await Hive.openBox<TaskCategorymodel>(taskCategoryDBname);
    return db.values.toList();
  }

  @override
  static Future<void> deleteTaskCategory(String id) async {
    final db = await Hive.openBox<TaskCategorymodel>(taskCategoryDBname);
    await db.delete(id);
    refresh();
  }
}
