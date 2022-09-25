import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 3)
class Taskmodel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String descriptionvocab;

  Taskmodel({
    required this.title,
    required this.date,
    required this.descriptionvocab,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
