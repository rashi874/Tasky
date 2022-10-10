// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:tasky/db/db_functions/events_db.dart';
import 'dart:math' as math;

// ignore: must_be_immutable
class EvevntTile extends StatefulWidget {
  final title;
  final subtitle;
  final leading;
  bool color = false;
  int? id;

  Color colors = Colors.grey;
  EvevntTile(
      {super.key,
      required this.title,
      required this.id,
      required this.subtitle,
      required this.leading});

  @override
  State<EvevntTile> createState() => _EvevntTileState();
}

class _EvevntTileState extends State<EvevntTile> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            onPressed: (value) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      'Delete Event!',
                      style: TextStyle(fontSize: 20),
                    ),
                    content: const Text('Do you confirm to delete'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          if (widget.id == null) {
                          } else {
                            EventsDb.deleteEvents(widget.id!);
                            log('deleted');
                          }
                          Navigator.pop(context, 'Delete');
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
            backgroundColor: const Color.fromARGB(255, 255, 66, 66),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          tileColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors
                .primaries[math.Random().nextInt(Colors.primaries.length)],
            child: Text(
              textAlign: TextAlign.center,
              parseDate(widget.leading).toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  String parseDate(DateTime date) {
    final dates = DateFormat.MMMd().format(date).toUpperCase();
    final splitedDate = dates.split(' ');
    return '${splitedDate.last}\n${splitedDate.first}';
  }
}
