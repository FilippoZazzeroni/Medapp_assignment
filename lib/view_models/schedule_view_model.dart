import 'package:flutter/material.dart';
import 'package:medapp_assignment/managers/application_manager.dart';
import 'package:medapp_assignment/models/moment.dart';
import 'package:medapp_assignment/views/schedule_view/moment_content.dart';
import 'package:medapp_assignment/views/schedule_view/moment_content_factory.dart';

class ScheduleViewModel extends ChangeNotifier {
  //! properties

  late final contents = {..._getMomentContents()};

  //! methods

  void setMomentState(MomentContent content) {
    final moment = contents[content];
    if (moment != null) {
      for (var medicine in moment.medicines) {
        medicine.isTaken = content.isSelected;
      }
    }
    notifyListeners();
  }

  void setState() {
    notifyListeners();
  }

  Map<MomentContent, Moment> _getMomentContents() {
    final contents = <MomentContent, Moment>{};
    for (var moment in ApplicationManager.instance.moments) {
      final contentFactory = MomentContentFactory(moment);
      final momentContent = contentFactory.makeMomentContent();
      contents[momentContent] = moment;
    }
    return contents;
  }
}
