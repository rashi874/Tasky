import 'package:flutter/material.dart';
import 'package:tasky/db/function/task_category/task_category_db.dart';
import 'package:tasky/db/models/data_model.dart';
import 'package:tasky/home/home_screen.dart';
import 'package:tasky/home/widgets/add_categories/widget/float_description.dart';
import 'package:tasky/home/widgets/add_categories/widget/floatwidget.dart';
import 'package:tasky/home/widgets/add_categories/widget/icons_widgets.dart';

class FloatMainbutton extends StatefulWidget {
  final String id;
  const FloatMainbutton({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<FloatMainbutton> createState() => _FloatMainbuttonState();
}

final titleController = TextEditingController();
final subtitleController = TextEditingController();
final descriptionController = TextEditingController();
final iconses = Icons.umbrella_sharp.codePoint;
// var selectedIcon = Icons.person.codePoint;

final formKey = GlobalKey<FormState>();
DateTime date = DateTime(2020, 11, 17);

class _FloatMainbuttonState extends State<FloatMainbutton> {
  bool customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    final List<int> allIcons = [
      Icons.umbrella_sharp.codePoint,
      Icons.favorite.codePoint,
      Icons.headphones.codePoint,
      Icons.home.codePoint,
      Icons.car_repair.codePoint,
      Icons.settings.codePoint,
      Icons.flight.codePoint,
      Icons.ac_unit.codePoint,
      Icons.run_circle.codePoint,
      Icons.book.codePoint,
      Icons.sports_rugby_rounded.codePoint,
      Icons.alarm.codePoint,
      Icons.call.codePoint,
      Icons.call.codePoint,
      Icons.snowing.codePoint,
      Icons.hearing.codePoint,
      Icons.music_note.codePoint,
      Icons.note.codePoint,
      Icons.edit.codePoint,
      Icons.sunny.codePoint,
      Icons.radar.codePoint,
    ];
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.all(12),
                  height: 480,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const Text(
                            'Create Task Category',
                            style: TextStyle(fontSize: 17),
                          ),
                          ElevatedButton(
                            child: const Text('Done'),
                            onPressed: () => taskcategoriesSave(),
                          ),
                        ],
                      ),
                      ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(15.0),
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextformfieldCustom(
                                  titles: 'Category name',
                                  controllers: titleController,
                                ),
                                const IconsWidgets(),
                                TextfieldCustomDescriprion(
                                  titles: 'Description',
                                  controllers: descriptionController,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
          },
        );
      },
      child: const Icon(
        Icons.add,
        size: 28,
      ),
    );
  }

  taskcategoriesSave() {
    // print(selectedIcon);
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      final taskcategories = TaskCategorymodel(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        sub: subtitleController.text.trim(),
        icon: selectedIcon,
      );
      titleController.clear();
      descriptionController.clear();
      Categorydb.addTaskCategory(taskcategories);
      Categorydb.refresh();
      Navigator.pop(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }
}
