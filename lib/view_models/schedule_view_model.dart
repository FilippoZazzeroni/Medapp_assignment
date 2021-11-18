import 'package:flutter/material.dart';
import 'package:medapp_assignment/models/moment.dart';
import 'package:medapp_assignment/views/schedule_view/moment_content.dart';
import 'package:medapp_assignment/views/schedule_view/moment_content_factory.dart';

class ScheduleViewModel extends ChangeNotifier {
  //! properties

  final List<Moment> _moments = [
    Moment(date: DateTime(2021, 1, 1), medicines: [], type: MomentType.badTime),
    Moment(date: DateTime(2021, 1, 2), medicines: [], type: MomentType.badTime),
    Moment(date: DateTime(2021, 1, 3), medicines: [], type: MomentType.lunch),
    Moment(date: DateTime(2021, 1, 3), medicines: [], type: MomentType.atWork),
    Moment(date: DateTime(2021, 1, 4), medicines: [], type: MomentType.breakfast),
    Moment(date: DateTime(2021, 1, 4), medicines: [], type: MomentType.breakfast),
  ];

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

  Map<MomentContent, Moment> _getMomentContents() {
    final contents = <MomentContent, Moment>{};
    for (var moment in _moments) {
      final contentFactory = MomentContentFactory(moment);
      final momentContent = contentFactory.makeMomentContent();
      contents[momentContent] = moment;
    }
    return contents;
  }
}
