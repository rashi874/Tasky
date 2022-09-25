import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../models/task/task_model.dart';

const taskDBname = 'task-db';

class TaskDb {
  
  static ValueNotifier<List<Taskmodel>> taskListNotifier = ValueNotifier([]);

  @override
  static Future<void> addTask(Taskmodel obj) async {
    final db = await Hive.openBox<Taskmodel>(taskDBname);
    await db.put(obj.id, obj);
  }

  static Future<void> refresh() async {
    final list = await getAllTask();
    // list.sort((first, second) => second.date.compareTo(first.date));
    taskListNotifier.value.clear();
    taskListNotifier.value.addAll(list);
    taskListNotifier.notifyListeners();
  }

  @override
  static Future<List<Taskmodel>> getAllTask() async {
    final db = await Hive.openBox<Taskmodel>(taskDBname);
    return db.values.toList();
  }

  @override
  static Future<void> deleteTask(String id) async {
    final db = await Hive.openBox<Taskmodel>(taskDBname);
    await db.delete(id);
    refresh();
  }
}
