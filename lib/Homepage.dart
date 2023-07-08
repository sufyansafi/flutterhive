// ignore: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutterhive/boxes.dart';
// import 'package:hive/hive.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    final titleController = TextEditingController();
  final descriptionController = TextEditingController();

 List<Color> colors = [Colors.purple , Colors.black38, Colors.green, Colors.blue , Colors.red] ;


Random random = Random(3);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Flutter Hive Database")),
      ),
      body: FutureBuilder(
        future: Hive.openBox("Sufyan"),
        builder: (context, snapshot) {
          return Column(
            children: [
              ListTile(
                title: Text(snapshot.data!.get("name").toString()),
                subtitle: Text(snapshot.data!.get("age").toString()),
                trailing: IconButton(
                  onPressed: () {
                    // for changing the value //
                    // snapshot.data!.put("name", "Moodymunda");
                    snapshot.data!.delete(
                      "age",
                    );
                    setState(() {});
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
              //                     TextButton(
              // onPressed: () async {
              //           showMyDialouge();
              //           var box = await Hive.openBox("Sufyan");
              //           box.put("name", "sufyansafi");
              //           box.put("age", '23');

              //           box.put('joblife',
              //               {"name": 'sufyansafi', 'age': '23', 'job': 'flutter deevlopr'});
              //           print(box.get('joblife')['job']);

              //           print(
              //             box.get("name"),
              //           );
              //           print(box.get("age"));
              //         },
              // child: Icon(Icons.call_split_rounded)),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            showMyDialog();
            var box = await Hive.openBox("Sufyan");
            box.put("name", "sufyansafi");
            box.put("age", '23');

            box.put('joblife',
                {"name": 'sufyansafi', 'age': '23', 'job': 'flutter deevlopr'});
            print(box.get('joblife')['job']);

            print(
              box.get("name"),
            );
            print(box.get("age"));
          },
          label: Icon(Icons.call_split_rounded)),
    );
  }
}

Future<void> showMyDialog() async {
  // var context;

  var context;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("ADD NOTES"),
          content: Column(
            children: [
              TextFormField(
                controller: TextEditingController(),
                decoration: new InputDecoration(
                  labelText: "Enter Title",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: TextEditingController(),
                decoration: new InputDecoration(
                  labelText: "Enter Descriprtion",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      });
}
