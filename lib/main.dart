import 'package:flutter/material.dart';
import 'package:medapp_assignment/views/schedule_view/schedule_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medapp assignment',
      theme: ThemeData(),
      home: ScheduleView(),
    );
  }
}
