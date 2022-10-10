import 'package:flutter/material.dart';
import 'package:tasky/const.dart';
import 'package:tasky/home/events/create_events_notification.dart';
import 'package:tasky/db/db_functions/events_db.dart';
import 'package:tasky/db/model/events_model.dart';
import 'package:tasky/home/events/events_tile.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  void initState() {
    super.initState();
    EventsDb.getAllEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          avatar,
                        ),
                      ),
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Inspirational Quotes',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                        box20,
                        Text(
                          ' “The best preparation for tomorrow is doing your best today.” – H. Jackson Brown, Jr.',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: EventsDb.eventsListNotifier,
                    builder:
                        (BuildContext ctx, List<EventsModel> eventsList, _) {
                      return (eventsList.isEmpty)
                          ? SizedBox(
                              height: 600,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      mainimg,
                                      height: 80,
                                    ),
                                  ),
                                  const Text(
                                    'Please Add Events',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                box20,
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "All Events",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 29, 29, 29),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        ' (${eventsList.length})',
                                        style: const TextStyle(
                                          // color: textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                box20,
                                ListView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final events = eventsList[index];
                                    return EvevntTile(
                                      leading: events.dueDate,
                                      subtitle: events.detail,
                                      title: events.title,
                                      id: events.id,
                                    );
                                  },
                                  itemCount: eventsList.length,
                                ),
                              ],
                            );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const CreateEvents(),
    );
  }
}
