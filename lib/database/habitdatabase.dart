import 'package:flutter/material.dart';
import 'package:habit_tracker/model/app_setting.dart';
import 'package:habit_tracker/model/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;
  // S E T U P
  static Future<void> initilize() async {
  final dir = await getApplicationDocumentsDirectory(); // تغيير المسار هنا
    isar =
        await Isar.open([HabitSchema, AppsittingSchema], directory: dir.path);
  }

  ////Handle setting time
// S a v e f i r s t d a t e
  Future<void> savefirstlaunchone() async {
    final existingsetting = await isar.appsittings.where().findFirst();
    if (existingsetting == null) {
      final settings = Appsitting()..firstlaunchDate = DateTime.now();
      await isar.writeTxn(() => isar.appsittings.put(settings));
    }
  }

  // g e t t i m e o f t o d a y
  Future<DateTime?> getfirstlaunchone() async {
    final setting = await isar.appsittings.where().findFirst();
    return setting?.firstlaunchDate; //16/9/2024
  }

  //LiST OF HABITS
  final List<Habit> currenthabit = [];
  //create
  Future<void> addnewhabit(String habitname) async {
    final newhabit = Habit()..name = habitname;
    await isar.writeTxn(() => isar.habits.put(newhabit));
    readhabit();
  }

// g e t a l l h a b i t
  Future<void> readhabit() async {
    List<Habit> fetchhabit = await isar.habits.where().findAll();
    currenthabit.clear();
    currenthabit.addAll(fetchhabit);
    notifyListeners();
  }

  Future<void> updatehabitcomplete(int id, bool iscompleted) async {
    final habit = await isar.habits.get(id);
    if (habit != null) {
      await isar.writeTxn(() async {
        final today = DateTime.now();
        final todayWithoutTime = DateTime(today.year, today.month, today.day);

        if (iscompleted && !habit.completename.contains(todayWithoutTime)) {
          // إذا كانت العادة مكتملة ولم يتم تسجيل اليوم
          habit.completename.add(todayWithoutTime);
        } else if (!iscompleted) {
          // إذا كانت العادة غير مكتملة، احذف تاريخ اليوم
          habit.completename.removeWhere((date) =>
              date.year == today.year &&
              date.month == today.month &&
              date.day == today.day);
        }

        await isar.habits.put(habit);
      });
    }
    readhabit(); // إعادة قراءة العادات وتحديث الواجهة
  }

  Future<void> updatehabit(int id, String name) async {
    final habit = await isar.habits.get(id);
    if (habit != null) {
      await isar.writeTxn(() async {
        habit.name = name;
        await isar.habits.put(habit);
      });
    }
    readhabit();
  }

  Future<void> deletehabit(int id) async {
    await isar.writeTxn(() async {
      await isar.habits.delete(id);
    });
    readhabit();
  }
}
