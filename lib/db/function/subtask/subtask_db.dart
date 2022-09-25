import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:tasky/db/models/sub_task/subtask_model.dart';

const subtaskDBname = 'Subtask-db';

abstract class SubTaskDbFunctions {
  Future<void> addSubTask(SubTaskmodel obj);
  Future<List<SubTaskmodel>> getAllSubTask();
  Future<void> deleteSubTask(String id);
}

class SubTaskDB implements SubTaskDbFunctions {
  SubTaskDB._internal();

  static SubTaskDB instance = SubTaskDB._internal();

  factory SubTaskDB() {
    return instance;
  }

  // ignore: non_constant_identifier_names
  ValueNotifier<List<SubTaskmodel>> SubtaskListNotifier = ValueNotifier([]);

  @override
  Future<void> addSubTask(SubTaskmodel obj) async {
    final db = await Hive.openBox<SubTaskmodel>(subtaskDBname);
    await db.put(obj.id, obj);
  }

  Future<void> refresh() async {
    final list = await getAllSubTask();
    // list.sort((first, second) => second.date.compareTo(first.date));
    SubtaskListNotifier.value.clear();
    SubtaskListNotifier.value.addAll(list);
    SubtaskListNotifier.notifyListeners();
  }

  @override
  Future<List<SubTaskmodel>> getAllSubTask() async {
    final db = await Hive.openBox<SubTaskmodel>(subtaskDBname);
    return db.values.toList();
  }

  @override
  Future<void> deleteSubTask(String id) async {
    final db = await Hive.openBox<SubTaskmodel>(subtaskDBname);
    await db.delete(id);
    refresh();
  }
}
