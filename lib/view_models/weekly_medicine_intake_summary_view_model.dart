import 'package:flutter/material.dart';
import 'package:medapp_assignment/managers/application_manager.dart';

class WeeklyMedicineIntakeSummaryViewModel extends ChangeNotifier {
  //! properties

  final summaryDate = DateTime(2021, 1, 7);

  //! methods

  int getAmountOfMedicineTaken() {
    return ApplicationManager.instance.getMomentsFrom(summaryDate).length;
  }
}
