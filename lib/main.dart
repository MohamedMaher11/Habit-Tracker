import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/database/habitdatabase.dart';
import 'package:habit_tracker/screen/splashscreen.dart';
import 'package:habit_tracker/theme/themeprovider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initial database
  await HabitDatabase.initilize();
  await HabitDatabase().savefirstlaunchone();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HabitDatabase()),
        ChangeNotifierProvider(create: (context) => Themeprovider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // صفحة التحميل أولاً
      theme: Provider.of<Themeprovider>(context).themedata,
      debugShowCheckedModeBanner: false,
    );
  }
}
