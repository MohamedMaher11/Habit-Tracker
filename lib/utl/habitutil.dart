import 'package:flutter/material.dart';
import 'package:habit_tracker/model/habit.dart';

bool ishabitcompletedtoday(List<DateTime> completedtoday) {
  final today = DateTime.now();
  return completedtoday.any((date) =>
      date.year == today.year &&
      date.month == today.month &&
      date.day == today.day);
}

Map<DateTime, int> prepmapdataset(List<Habit> habits) {
  Map<DateTime, int> dataset = {};
  for (var habit in habits) {
    for (var date in habit.completename) {
      final normilizedate = DateTime(date.year, date.month, date.day);
      if (dataset.containsKey(normilizedate)) {
        dataset[normilizedate] = dataset[normilizedate]! + 1;
      } else {
        dataset[normilizedate] = 1;
      }
    }
  }
  return dataset;
}
