import 'package:flutter/material.dart';
import 'package:medapp_assignment/shared/color_palette.dart';
import 'package:medapp_assignment/view_models/schedule_view_model.dart';
import 'package:medapp_assignment/view_models/weekly_medicine_intake_summary_view_model.dart';
import 'package:medapp_assignment/views/schedule_view/schedule_view.dart';
import 'package:medapp_assignment/views/weekly_medicine_intake_summary_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _navigationBarItems = [const ScheduleView(), const WeeklyMedicineIntakeSummaryView()];

  int _navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScheduleViewModel()),
        ChangeNotifierProvider(create: (_) => WeeklyMedicineIntakeSummaryViewModel()),
      ],
      child: MaterialApp(
        title: 'Medapp assignment',
        theme: ThemeData(),
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: ColorPalette.primary,
              selectedItemColor: ColorPalette.secondary,
              onTap: (index) {
                _navigationIndex = index;
                setState(() {});
              },
              currentIndex: _navigationIndex,
              items: const [BottomNavigationBarItem(icon: Icon(Icons.schedule), label: "schedule"), BottomNavigationBarItem(icon: Icon(Icons.book), label: "summary")]),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: _navigationBarItems[_navigationIndex],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
