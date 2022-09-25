import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class TaskCategorymodel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String sub;

  @HiveField(4)
  final int icon;

  TaskCategorymodel(
      {required this.title,
      required this.description,
      required this.sub,
      required this.icon}) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
