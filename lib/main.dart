import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'student_profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: "Student Profile App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFF3F51B5),
            scaffoldBackgroundColor: const Color(0xFFF5F5FA),
            fontFamily: "Roboto",
          ),
          home: const StudentProfileScreen(),
        );
      },
    );
  }
}
