 



import 'package:flutterhive/models/modelofnotes.dart';
import 'package:hive/hive.dart';

class Boxes {

  static Box<ModelofNotes> getData() => Hive.box<ModelofNotes>('notes');

}