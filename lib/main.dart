import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tobee_todo_list/services/provider.dart';
import 'package:tobee_todo_list/views/home.dart';
import 'package:tobee_todo_list/views/home1.dart';
import 'package:tobee_todo_list/views/home2.dart';

import 'package:tobee_todo_list/views/on_boarding.dart';
import 'package:tobee_todo_list/views/pomodoro_timer.dart';
import 'package:tobee_todo_list/views/pomodoro_timer_poage.dart';
import 'package:tobee_todo_list/views/pprofile.dart';
import 'package:tobee_todo_list/views/tasks.dart';
import 'package:tobee_todo_list/views/tasks2.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TaskProvider()),
    ],
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:OnBoarding()
    );
  }
}

