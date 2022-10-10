import 'package:hive_flutter/adapters.dart';
part 'events_model.g.dart';

@HiveType(typeId: 3)
class EventsModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  String? detail;

  @HiveField(3)
  final DateTime dueDate;

  @HiveField(4)
  final String time;

  @HiveField(5)
  final int snooze;

  EventsModel({
    required this.dueDate,
    required this.time,
    required this.snooze,
    this.id,
    required this.title,
    this.detail,
  });
}
