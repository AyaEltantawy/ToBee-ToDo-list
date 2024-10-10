import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tobee_todo_list/views/add_task.dart';
import 'package:tobee_todo_list/views/home1.dart';
import 'package:tobee_todo_list/views/home2.dart';

import 'package:tobee_todo_list/views/pomodoro_timer.dart';
import 'package:tobee_todo_list/views/pomodoro_timer_poage.dart';
import 'package:tobee_todo_list/views/pprofile.dart';
import 'package:tobee_todo_list/views/rewards.dart';
import 'package:tobee_todo_list/views/tasks.dart';

/// I put curvednavigationbar to navigate between screens.



class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
bool INDEX =true;
  final screens = [
    TaskListPage(),
    PomodoroTimerPage(),
RewardsPage(),


    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final items = <Widget>[
      Icon(Icons.home, size: 30),

      Icon(Icons.timer, size: 30),

      Icon(Icons.card_giftcard, size: 30),
      Icon(Icons.person, size: 30),
    ];
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color:  Colors.white)),
        child: CurvedNavigationBar(
            key: navigationKey,
            backgroundColor: Colors.transparent,
            animationDuration: Duration(milliseconds: 300),
            color: Colors.black,
            buttonBackgroundColor: Colors.orange,
            height: 60,
            index: index,
            items: items,
            onTap: (index) => setState(() => this.index = index)),
      ),
    );
  }
}
