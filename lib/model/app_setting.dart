import 'package:isar/isar.dart';
part 'app_setting.g.dart';

@Collection()
class Appsitting {
  Id id = Isar.autoIncrement;
  DateTime? firstlaunchDate; //16/9/2024
}
