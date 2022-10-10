// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../../db/model/task_model.dart';

class MainCards extends StatelessWidget {
  final title;
  final subtitle;
  final maincolor;
  final subcolor;
  final cardcolor;
  final listenable;
  final titlecolor;
  final Widget widget;
  const MainCards({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.maincolor,
    required this.subcolor,
    required this.cardcolor,
    required this.listenable,
    required this.titlecolor,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: listenable,
        builder: (BuildContext ctx, List<Taskmodel> taskList, _) {
          return GestureDetector(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => widget,
                ),
              );
            }),
            child: Card(
              color: cardcolor,
              surfaceTintColor: Colors.white,
              elevation: 7,
              shadowColor:
                  const Color.fromARGB(255, 157, 157, 157).withOpacity(0.2),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: const Color.fromARGB(255, 210, 210, 210)
                          .withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(17)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: titlecolor,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.segment,
                              color: subcolor,
                            ),
                          ),
                          CircleAvatar(
                            child: Text(
                              taskList.length.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: titlecolor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
