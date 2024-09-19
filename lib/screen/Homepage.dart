import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/components/drawer.dart';
import 'package:habit_tracker/components/heatmap.dart';
import 'package:habit_tracker/database/habitdatabase.dart';
import 'package:habit_tracker/model/habit.dart';
import 'package:habit_tracker/theme/dark.dart';
import 'package:habit_tracker/theme/light.dart';
import 'package:habit_tracker/theme/themeprovider.dart';
import 'package:habit_tracker/utl/customtoggle.dart';
import 'package:habit_tracker/utl/habittile.dart';
import 'package:habit_tracker/utl/habitutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkMode = false;

  ThemeProvider() {
    // لا حاجة لاستدعاء _loadTheme هنا مباشرة
  }

  // تحميل الثيم من SharedPreferences
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  // تبديل الثيم وحفظه في SharedPreferences
  void toggleTheme() async {
    isDarkMode = !isDarkMode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  // استرجاع الثيم المناسب بناءً على حالة isDarkMode
  ThemeData get themeData {
    return isDarkMode ? dark : light;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // قراءة العادات عند بدء التشغيل
    Provider.of<HabitDatabase>(context, listen: false).readhabit();
  }

  // تغيير حالة العادة (مكتملة أو غير مكتملة)
  void checkHabitOnOff(bool? value, Habit habit) {
    if (value != null) {
      context.read<HabitDatabase>().updatehabitcomplete(habit.id, value);
    }
  }

  // حذف العادة
  void deleteHabit(Habit habit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are you sure you want to delete?"),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<HabitDatabase>().deletehabit(habit.id);
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          )
        ],
      ),
    );
  }

  // تعديل العادة
  void editHabit(Habit habit) {
    nameController.text = habit.name;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: nameController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              String newHabitName = nameController.text;
              context.read<HabitDatabase>().updatehabit(habit.id, newHabitName);
              Navigator.pop(context);
              nameController.clear();
            },
            child: const Text("Save"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              nameController.clear();
            },
            child: const Text("Cancel"),
          )
        ],
      ),
    );
  }

  // إنشاء عادة جديدة
  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          decoration: const InputDecoration(hintText: 'Create a new habit'),
          controller: nameController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              String newHabitName = nameController.text;
              context.read<HabitDatabase>().addnewhabit(newHabitName);
              Navigator.pop(context);
              nameController.clear();
            },
            child: const Text("Save"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              nameController.clear();
            },
            child: const Text("Cancel"),
          )
        ],
      ),
    );
  }

  // بناء الواجهة
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: CustomSwitch(
              isDarkMode: themeProvider.isdarkmode,
              onChanged: (value) {
                themeProvider.toggletheme();
              },
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewHabit,
        elevation: 0,
        backgroundColor: themeProvider.isdarkmode ? Colors.black : Colors.white,
        child: Icon(
          Icons.add,
          color: themeProvider.isdarkmode ? Colors.white : Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [buildHeatMap(), buildHabitList()],
        ),
      ),
    );
  }

  // بناء الخريطة الحرارية للعادات
  Widget buildHeatMap() {
    final habitDatabase = context.watch<HabitDatabase>();
    List<Habit> currentHabit = habitDatabase.currenthabit;
    return FutureBuilder<DateTime?>(
      future: habitDatabase.getfirstlaunchone(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return myheatmap(
            startdate: snapshot.data!,
            datasets: prepmapdataset(currentHabit),
          );
        } else {
          return Container();
        }
      },
    );
  }

  // بناء قائمة العادات
  Widget buildHabitList() {
    final habitDatabase = context.watch<HabitDatabase>();
    List<Habit> currentHabit = habitDatabase.currenthabit;
    return ListView.builder(
      itemCount: currentHabit.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final habit = currentHabit[index];
        bool isCompletedToday = ishabitcompletedtoday(habit.completename);
        return HabitListTile(
          isCompleted: isCompletedToday,
          text: habit.name,
          onChanged: (value) => checkHabitOnOff(value, habit),
          editHabit: (context) => editHabit(habit),
          deleteHabit: (context) => deleteHabit(habit),
        );
      },
    );
  }
}
