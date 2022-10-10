import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/task_model.dart';

class TaskDB {
  static ValueNotifier<List<Taskmodel>> pendingTaskListNotifier =
      ValueNotifier([]);
  static ValueNotifier<List<Taskmodel>> starredTaskListNotifier =
      ValueNotifier([]);
  static ValueNotifier<List<Taskmodel>> completedTaskListNotifier =
      ValueNotifier([]);

  static Future addTask(Taskmodel task) async {
    final taskDB = await Hive.openBox<Taskmodel>('task_db');
    final id = await taskDB.add(task);
    task.id = id;
    taskDB.put(task.id, task);
    pendingTaskListNotifier.value.add(task);
    sortTask(pendingTaskListNotifier.value);
    refreshUI();
  }

  static sortTask(List<Taskmodel> task) {
    task.sort((a, b) => a.date.compareTo(b.date));
  }

  static Future<void> deleteTask(int id) async {
    final taskDB = await Hive.openBox<Taskmodel>('task_db');
    await taskDB.delete(id);

    await Hive.deleteBoxFromDisk('$id');

    getAllTask();
  }

  static Future<void> reset(int id) async {
    final taskDB = await Hive.openBox<Taskmodel>('task_db');
    await taskDB.deleteAll(taskDB.keys);
    await Hive.deleteBoxFromDisk('$id');
    getAllTask();
  }

  static Future<void> updateTask(Taskmodel task) async {
    final taskDB = await Hive.openBox<Taskmodel>('task_db');
    await taskDB.put(task.id, task);

    getAllTask();
  }

  static Future<void> getAllTask() async {
    final taskDB = await Hive.openBox<Taskmodel>('task_db');
    pendingTaskListNotifier.value.clear();
    starredTaskListNotifier.value.clear();
    completedTaskListNotifier.value.clear();

    for (var task in taskDB.values) {
      if (task.isCompleted) {
        completedTaskListNotifier.value.add(task);
      } else if (task.isStarred) {
        starredTaskListNotifier.value.add(task);
        pendingTaskListNotifier.value.add(task);
      } else {
        pendingTaskListNotifier.value.add(task);
      }
    }
    sortTask(pendingTaskListNotifier.value);
    sortTask(starredTaskListNotifier.value);
    sortTask(completedTaskListNotifier.value);
    refreshUI();
  }

  static Future<void> editTask(Taskmodel task, int id) async {
    final taskDB = await Hive.openBox<Taskmodel>('task_db');
    // final id = await taskDB.add(task);
    task.id = id;
    taskDB.put(task.id, task);
    pendingTaskListNotifier.value.add(task);
    sortTask(pendingTaskListNotifier.value);
    refreshUI();
    getAllTask();
    //
    // final taskDB = await Hive.openBox<Taskmodel>('task_db');
    // taskDB.put(id, task);
    // getAllTask();
  }

  static refreshUI() {
    pendingTaskListNotifier.notifyListeners();
    starredTaskListNotifier.notifyListeners();
    completedTaskListNotifier.notifyListeners();
  }
}
