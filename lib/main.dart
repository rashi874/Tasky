import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasky/db/models/data_model.dart';
import 'package:tasky/db/models/sub_task/subtask_model.dart';
import 'package:tasky/db/models/task/task_model.dart';

import 'package:tasky/screens/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TaskCategorymodelAdapter().typeId)) {
    Hive.registerAdapter(TaskCategorymodelAdapter());
  }
  if (!Hive.isAdapterRegistered(TaskmodelAdapter().typeId)) {
    Hive.registerAdapter(TaskmodelAdapter());
  }

  if (!Hive.isAdapterRegistered(SubTaskmodelAdapter().typeId)) {
    Hive.registerAdapter(SubTaskmodelAdapter());
  }

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(255, 255, 255, 255)));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        // scaffoldBackgroundColor: Color.fromARGB(255, 246, 246, 246),
        // canvasColor: Colors.white,
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: GoogleFonts.saralaTextTheme(
          Theme.of(context).textTheme,
          
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 67, 67, 67),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 67, 67, 67),
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
