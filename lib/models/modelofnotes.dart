
import 'package:hive/hive.dart';
part 'modelofnotes.g.dart';
//import 'package:hive/hive.dart';

@HiveType(typeId: 0)

class ModelofNotes {

  @HiveField(0)
  String title;
  @HiveField(1)
  String description;

  ModelofNotes({required this.description, required this.title});

  void save() {}
}
