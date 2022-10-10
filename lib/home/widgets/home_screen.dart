import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/const.dart';
import 'package:tasky/db/db_functions/task_db.dart';
import 'package:tasky/home/events/events_banner.dart';
import 'package:tasky/home/search/search.dart';
import 'package:tasky/home/settings/settings.dart';
import 'package:tasky/home/tasks/create_task.dart';
import 'package:tasky/home/tasks/listview_tiles.dart';
import 'package:tasky/home/widgets/completed_task.dart';
import 'package:tasky/home/widgets/favorite_task.dart';
import 'package:tasky/home/widgets/main_card.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  const HomeScreen({super.key, required this.name});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // _tabController = TabController(length: 3, vsync: this);
    TaskDB.getAllTask();

    // EventsDb.getAllEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // toolbarHeight: 65,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingsScreen(
                          name: ' @ ${widget.name.toUpperCase()}',
                        )),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage(avatar),
            ),
          ),
        ),
        title: Text(
          'Tasky',
          style: GoogleFonts.sniglet(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        // backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // box20,
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 180,
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      newbanner,
                    ),
                  ),
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Hellooo.",
                            style: GoogleFonts.manrope(
                                letterSpacing: 0.5,
                                // height: 2.0,
                                fontSize: 20,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                '@${widget.name.toUpperCase()}',
                                style: GoogleFonts.manrope(
                                    letterSpacing: 0.5,
                                    // height: 2.0,
                                    fontSize: 14,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Icon(Icons.verified),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Material(
                        elevation: 1.5,
                        shadowColor: const Color.fromARGB(121, 137, 137, 137),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        child: TextFormField(
                          readOnly: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Search()),
                            );
                          },
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 115, 115, 115)),
                            label: Row(
                              children: [
                                AnimatedTextKit(
                                  repeatForever: true,
                                  // totalRepeatCount: 20,
                                  animatedTexts: [
                                    RotateAnimatedText(
                                        'Personal Development tasks.'),
                                    RotateAnimatedText(
                                        'Health Development Tasks.'),
                                    RotateAnimatedText('Goal Achieving Tasks.'),
                                  ],
                                  onTap: () {
                                    // print("Tap Event");
                                  },
                                ),
                              ],
                            ),
                            hintStyle: const TextStyle(fontSize: 12),
                            prefixIcon: const Icon(Icons.search),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            border: InputBorder.none,
                            // hintText: '',
                          ),
                        ),
                      ),
                    ),

                    Text(
                      'Break goals into manageable tasks',
                      style: GoogleFonts.manrope(
                          letterSpacing: 0.2,
                          // height: 2.0,
                          fontSize: 12,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w400),
                      // style: const TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.w500,
                      //     color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    // box20,
                  ],
                ),
              ),
            ),
            // const PremiumBanner(),

            box20,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5),
              child: Text(
                'Suggested for you',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 80, 80, 80)),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainCards(
                  cardcolor: const Color.fromARGB(255, 255, 255, 255),
                  maincolor: const Color.fromARGB(255, 248, 248, 248),
                  subcolor: const Color.fromARGB(255, 46, 97, 253),
                  subtitle: 'All Completed tasks',
                  title: 'Completed tasks',
                  listenable: TaskDB.completedTaskListNotifier,
                  titlecolor: const Color.fromARGB(255, 29, 29, 29),
                  widget: CompletedTasks(
                      listenable: TaskDB.completedTaskListNotifier),
                ),
                MainCards(
                  cardcolor: const Color.fromARGB(255, 255, 255, 255),
                  maincolor: const Color.fromARGB(255, 248, 248, 248),
                  subcolor: const Color.fromARGB(255, 46, 97, 253),
                  subtitle: 'All Favorite Tasks',
                  title: 'Favorite tasks',
                  listenable: TaskDB.starredTaskListNotifier,
                  titlecolor: const Color.fromARGB(255, 29, 29, 29),
                  widget:
                      FavoriteTasks(listenable: TaskDB.starredTaskListNotifier),
                ),
              ],
            ),
            box20,
            const EventsBanner(),
            Listviewtile(
              listenable: TaskDB.pendingTaskListNotifier,
            ),
            box20,
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                  child: Text(
                'Showing Tasks you created',
                style: TextStyle(fontSize: 10),
              )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // selectedDate = DateTime.now();
          // selectedCategory = null;
          createTask(context);
        },
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  displayTheNextElementOfTheList() {
    'rgrg';
    'grgrgrg';
    'rgrgrgrg';
  }
}
