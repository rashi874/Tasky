// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/subjects.dart';
// import 'package:taskynew/db/db_functions/events_db.dart';
// import 'package:taskynew/db/model/evets_model.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;

// class LocalNotificationService {
//   LocalNotificationService();

//   final _localNotificationService = FlutterLocalNotificationsPlugin();

//   final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

//   Future<void> intialize() async {
//     tz.initializeTimeZones();
//     const AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings('@drawable/ic_stat_android');

//     IOSInitializationSettings iosInitializationSettings =
//         IOSInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );

//     final InitializationSettings settings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iosInitializationSettings,
//     );

//     await _localNotificationService.initialize(
//       settings,
//       onSelectNotification: onSelectNotification,
//     );
//   }

//   Future<NotificationDetails> _notificationDetails() async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails('channel_id 6', 'channel_name',
//             channelDescription: 'description',
//             importance: Importance.max,
//             priority: Priority.max,
//             playSound: true);

//     const IOSNotificationDetails iosNotificationDetails =
//         IOSNotificationDetails();

//     return const NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: iosNotificationDetails,
//     );
//   }

//   Future<void> showNotification({
//     required int id,
//     required String title,
//     required String body,
//   }) async {
//     final details = await _notificationDetails();
//     await _localNotificationService.show(id, title, body, details);
//   }

//   Future<void> showScheduledNotification(
//       {
//       // required int id,
//       // required String title,
//       // required String body,
//       // required int seconds,
//       required int hour,
//       required int minute,
//       required EventsModel events}) async {
//     final details = await _notificationDetails();
//     await _localNotificationService.zonedSchedule(
//         events.id!.toInt(),
//         events.title,
//         events.detail,
//         _convertTime(hour, minute),
//         const NotificationDetails(
//           android: AndroidNotificationDetails('channelId', 'channelName',
//               importance: Importance.max, priority: Priority.high),
//           iOS: IOSNotificationDetails(),
//         ),
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//         matchDateTimeComponents: DateTimeComponents.time,
//         payload: '${events.id}',
//         androidAllowWhileIdle: true);
// // eventsnts.id!.toInt(),
// //         events.title,
// //         // events.content,
// //         _convertTime
// //       tz.TZDateTime.from(
// //         DateTime.now().add(Duration(
// //           seconds: seconds,
// //         )),
// //         tz.local,
// //       ),
// //       details,
// //       androidAllowWhileIdle: true,
// //       uiLocalNotificationDateInterpretation:
// //           UILocalNotificationDateInterpretation.absoluteTime,
// //     );
//   }

//   tz.TZDateTime _convertTime(int hour, int minute) {
//     tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate =
//         tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
//     return scheduledDate;
//   }

//   Future<void> showNotificationWithPayload(
//       {required int id,
//       required String title,
//       required String body,
//       required String payload}) async {
//     final details = await _notificationDetails();
//     await _localNotificationService.show(id, title, body, details,
//         payload: payload);
//   }

//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {
//     print('id $id');
//   }

//   void onSelectNotification(String? payload) {
//     print('payload $payload');
//     if (payload != null && payload.isNotEmpty) {
//       onNotificationClick.add(payload);
//     }
//   }
// }
