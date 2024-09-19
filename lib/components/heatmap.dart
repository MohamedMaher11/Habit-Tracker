import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:habit_tracker/database/habitdatabase.dart';
import 'package:habit_tracker/model/habit.dart';

class myheatmap extends StatelessWidget {
  final DateTime startdate;
  Map<DateTime, int>? datasets;

  myheatmap({super.key, required this.startdate, required this.datasets});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      margin: EdgeInsets.only(top: 5),
      startDate: startdate,
      endDate: DateTime.now(),
      datasets: datasets,
      colorMode: ColorMode.color,
      defaultColor: Colors.grey.shade400, // تغيير اللون الافتراضي إلى رمادي
      textColor: Theme.of(context).brightness == Brightness.light
          ? Colors.black // اللون في الثيم الـ Light
          : Colors.white, // اللون في الثيم الـ Dark
      showColorTip: false,
      showText: true,
      scrollable: true,
      size: 30,
      colorsets: {
        1: Colors.green.shade200,
        2: Colors.green.shade300,
        3: Colors.green.shade400,
        4: Colors.green.shade500,
        5: Colors.green.shade600,
      },
      // هنا لما تدوس على يوم معين في الـ Heatmap
      onClick: (date) {
        // بنستدعي الدالة اللي بتجيب العادات اللي اتعملت في اليوم ده
        showHabitsForDay(context, date);
      },
    );
  }

  void showHabitsForDay(BuildContext context, DateTime date) {
    // Get the HabitDatabase to fetch habits
    HabitDatabase habitDatabase =
        Provider.of<HabitDatabase>(context, listen: false);

    // Find habits completed on the selected date
    List<Habit> habitsForDay = habitDatabase.currenthabit.where((habit) {
      return habit.completename.any((completedDate) =>
          completedDate.year == date.year &&
          completedDate.month == date.month &&
          completedDate.day == date.day);
    }).toList();

    // Show dialog with the completed habits in a chic and engaging way
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Theme.of(context).cardColor, // حافظ على لون الـ Card
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:
                Theme.of(context).cardColor, // نفس لون الكارت المستخدم في الثيم
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                // Habit finished at 18/9/2024 --> 1- play football 2- read book

                child: Text(
                  "Habits completed on \n${date.day}/${date.month}/${date.year}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black // اللون في الثيم الـ Light
                        : Colors.white, // اللون في الثيم الـ Dark
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: habitsForDay.asMap().entries.map((entry) {
                  int index = entry.key + 1;
                  Habit habit = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(
                            "$index",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            habit.name,
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color, // حافظ على لون النص الرئيسي
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Great",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black // اللون في الثيم الـ Light
                          : Colors.white, // اللون في الثيم الـ Dark
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
