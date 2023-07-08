import 'package:flutter/material.dart';
// import 'package:flutterhive/Homepage.dart';
import 'package:flutterhive/home.dart';
import 'package:flutterhive/models/modelofnotes.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  //initalizd the class of model of notes adapter
  Hive.registerAdapter(ModelofNotesAdapter());
  //local phone ki storage k upper directory provide kr dega data store kna k lye or hive data base ko vo path mil jai ga
  Hive.init(directory.path);
  await Hive.openBox<ModelofNotes>("notes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
