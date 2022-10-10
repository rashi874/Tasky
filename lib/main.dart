import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasky/db/model/events_model.dart';
import 'package:tasky/db/model/subtask_model.dart';
import 'package:tasky/db/model/task_model.dart';
import 'package:tasky/home/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(TaskmodelAdapter().typeId)) {
    Hive.registerAdapter(TaskmodelAdapter());
  }
  if (!Hive.isAdapterRegistered(SubTaskModelAdapter().typeId)) {
    Hive.registerAdapter(SubTaskModelAdapter());
  }
  if (!Hive.isAdapterRegistered(EventsModelAdapter().typeId)) {
    Hive.registerAdapter(EventsModelAdapter());
  }

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 46, 97, 253),
          foregroundColor: Colors.white,
        ),
        // scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 46, 97, 253),
              // const Color.fromARGB(255, 18, 39, 81),
            ),
            foregroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
