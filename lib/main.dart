import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/subjects_screen.dart';
import 'screens/subject_details_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/add_task_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/exams_screen.dart';
import 'screens/profile_screen.dart';

// Same shape as slide 70 of your notes: initialRoute + routes Map.
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/login": (context) => LoginScreen(),
        "/home": (context) => HomeScreen(),
        "/subjects": (context) => SubjectsScreen(),
        "/subject-details": (context) => SubjectDetailsScreen(),
        "/tasks": (context) => TasksScreen(),
        "/add-task": (context) => AddTaskScreen(),
        "/schedule": (context) => ScheduleScreen(),
        "/exams": (context) => ExamsScreen(),
        "/profile": (context) => ProfileScreen(),
      },
    ));