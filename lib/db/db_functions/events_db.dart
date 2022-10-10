import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasky/db/model/events_model.dart';

class EventsDb {
  static ValueNotifier<List<EventsModel>> eventsListNotifier =
      ValueNotifier([]);

  static Future addEvents(EventsModel events) async {
    final eventsDB = await Hive.openBox<EventsModel>('Events_db');
    final id = await eventsDB.add(events);
    events.id = id;
    eventsDB.put(id, events);
    eventsListNotifier.value.add(events);
    getAllEvents();
    // refreshUI();
  }

  static Future<void> deleteEvents(int id) async {
    final eventsDB = await Hive.openBox<EventsModel>('Events_db');
    eventsDB.delete(id);
    getAllEvents();
  }

  static Future<void> getAllEvents() async {
    final eventsDB = await Hive.openBox<EventsModel>('Events_db');
    eventsListNotifier.value.clear();
    eventsListNotifier.value.addAll(eventsDB.values);
    eventsListNotifier.notifyListeners();
  }

  static refreshUI() {
    eventsListNotifier.notifyListeners();
  }

  static Future<void> resetevent(int id) async {
    final eventsDB = await Hive.openBox<EventsModel>('Events_db');
    await eventsDB.deleteAll(eventsDB.keys);
    await Hive.deleteBoxFromDisk('$id');
    getAllEvents();
  }
}
