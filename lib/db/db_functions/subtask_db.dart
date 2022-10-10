import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasky/db/db_functions/task_db.dart';
import 'package:tasky/db/model/subtask_model.dart';
import 'package:tasky/db/model/task_model.dart';

class SubTaskDb {
  static ValueNotifier<List<SubTaskModel>> subTaskListNotifier =
      ValueNotifier([]);

  static Future addSubTask(Taskmodel task, SubTaskModel subTask) async {
    final subTaskDB = await Hive.openBox<SubTaskModel>('${task.id}');
    final id = await subTaskDB.add(subTask);
    subTask.id = id;
    subTaskDB.put(subTask.id, subTask);
    subTaskListNotifier.value.add(subTask);
    refreshUI();
  }

  static Future<void> updateSubTask(
      Taskmodel task, SubTaskModel subTask, bool value) async {
    final subTaskDB = await Hive.openBox<SubTaskModel>('${task.id}');

    await subTaskDB.put(subTask.id, subTask);

    if (subTaskDB.values.any((element) => element.isCompleted == false)) {
    } else {
      task.isCompleted = true;
      TaskDB.updateTask(task);
    }
  }

  static Future<void> deleteSubTask(Taskmodel task, int id) async {
    final subTaskDB = await Hive.openBox<SubTaskModel>('${task.id}');
    await subTaskDB.delete(id);
    getAllSubTask(task);

    if (subTaskDB.values.any((element) => element.isCompleted == false)) {
    } else {
      task.isCompleted = true;
      TaskDB.updateTask(task);
    }
  }

  static Future<void> getAllSubTask(Taskmodel task) async {
    final subTaskDB = await Hive.openBox<SubTaskModel>('${task.id}');
    subTaskListNotifier.value.clear();
    subTaskListNotifier.value.addAll(subTaskDB.values);
    refreshUI();
  }

  static refreshUI() {
    subTaskListNotifier.notifyListeners();
  }

  static Future<void> reset(int id) async {
    final subTaskDB = await Hive.openBox<SubTaskModel>('task_db');
    await subTaskDB.deleteAll(subTaskDB.keys);
    await Hive.deleteBoxFromDisk('$id');
  }
}
