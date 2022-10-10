// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:tasky/const.dart';
import 'package:tasky/db/db_functions/events_db.dart';
import 'package:tasky/db/model/events_model.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class CreateEvents extends StatefulWidget {
  const CreateEvents({Key? key}) : super(key: key);

  @override
  State<CreateEvents> createState() => _CreateEventsState();
}

class _CreateEventsState extends State<CreateEvents> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();

  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    const IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
      macOS: null,
      linux: null,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (dataYouNeedToUseWhenNotificationIsClicked) {},
    );
  }

  showNotification() async {
    if (_title.text.isEmpty || _desc.text.isEmpty) {
      return;
    }

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      "ScheduleNotification001",
      "Notify Me",
      importance: Importance.high,
    );

    const IOSNotificationDetails iosNotificationDetails =
        IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
      macOS: null,
      linux: null,
    );
    // final List<PendingNotificationRequest> pendingNotificationRequests =
    //     await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    // flutterLocalNotificationsPlugin.show(
    //     01, _title.text, _desc.text, notificationDetails);

    tz.initializeTimeZones();
    final tz.TZDateTime scheduledAt = tz.TZDateTime.from(dateTime, tz.local);

    flutterLocalNotificationsPlugin.zonedSchedule(
        01, _title.text, _desc.text, scheduledAt, notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        androidAllowWhileIdle: true,
        payload: 'Ths s the data');
    if (formKey.currentState!.validate()) {
      final events = EventsModel(
        dueDate: dateTime,
        time: dateTime.toString(),
        snooze: 1,
        title: _title.text.toString(),
        detail: _desc.text.trim(),
      );

      EventsDb.addEvents(events);

      _title.clear();
      _desc.clear();

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.all(12),
                height: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                          'Create Event ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Form(
                      key: formKey,
                      child: Material(
                        color: const Color.fromARGB(186, 207, 207, 209)
                            .withOpacity(.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: TextFormField(
                          controller: _title,
                          validator: (value) {
                            return value!.trim().isNotEmpty
                                ? null
                                : 'Please Enter a events name';
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            border: InputBorder.none,
                            hintText: 'New event',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Material(
                      color: const Color.fromARGB(186, 207, 207, 209)
                          .withOpacity(.2),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: TextFormField(
                        controller: _desc,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          border: InputBorder.none,
                          hintText: 'Small Description',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
////

                        GestureDetector(
                          onTap: () async {
                            final TimeOfDay? slectedTime = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now());

                            if (slectedTime == null) {
                              return;
                            }

                            _time.text =
                                "${slectedTime.hour}:${slectedTime.minute}:${slectedTime.period.toString()}";

                            DateTime newDT = DateTime(
                              dateTime.year,
                              dateTime.month,
                              dateTime.day,
                              slectedTime.hour,
                              slectedTime.minute,
                            );
                            setState(() {
                              dateTime = newDT;
                            });
                          },
                          child: Card(
                            color: Colors.white,
                            surfaceTintColor: Colors.white,
                            elevation: 7,
                            shadowColor:
                                const Color.fromARGB(255, 157, 157, 157)
                                    .withOpacity(0.2),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Due Time',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(
                                        Icons.punch_clock_rounded,
                                        color: Color.fromARGB(255, 46, 97, 253),
                                        size: 25,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${dateTime.hour}:${dateTime.minute}',
                                          style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 12, 12, 12),
                                            fontSize: 12,
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

                        ///
                        GestureDetector(
                          onTap: () async {
                            final DateTime? newlySelectedDate =
                                await showDatePicker(
                              context: context,
                              initialDate: dateTime,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2095),
                            );

                            if (newlySelectedDate == null) {
                              return;
                            }

                            setState(() {
                              dateTime = newlySelectedDate;
                              // _date.text =
                              //     "${dateTime.year}/${dateTime.month}/${dateTime.day}";
                            });
                          },
                          child: Card(
                            color: Colors.white,
                            surfaceTintColor: Colors.white,
                            elevation: 7,
                            shadowColor:
                                const Color.fromARGB(255, 157, 157, 157)
                                    .withOpacity(0.2),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Due Date',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(
                                        Icons.calendar_month_outlined,
                                        color: Color.fromARGB(255, 46, 97, 253),
                                        size: 25,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          DateFormat('dd-MM-yyyy')
                                              .format(dateTime),
                                          style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 12, 12, 12),
                                            fontSize: 12,
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
                      ],
                    ),
                    box20,
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 55),
                        ),
                        onPressed: showNotification,
                        child: const Text("Show Notification")),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 28,
        ));
  }
}
