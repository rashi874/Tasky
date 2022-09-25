import 'package:hive_flutter/adapters.dart';
part 'subtask_model.g.dart';

@HiveType(typeId: 2)
class SubTaskmodel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String title;

  SubTaskmodel({
    required this.title,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
