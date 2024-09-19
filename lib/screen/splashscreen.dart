import 'package:flutter/material.dart';
import 'package:habit_tracker/screen/Homepage.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // الانتقال بعد 5 ثواني إلى الصفحة الرئيسية
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية بيضاء
      body: Center(
        child: Lottie.asset(
          'assets/loading.json', // مسار الـ Lottie Animation
          width: 200, // عرض الـ Lottie
          height: 200, // ارتفاع الـ Lottie
          fit: BoxFit.cover, // تعديل الحجم ليكون مناسب
        ),
      ),
    );
  }
}
