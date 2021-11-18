import 'package:flutter/material.dart';
import 'package:medapp_assignment/models/medicine.dart';
import 'package:medapp_assignment/models/moment.dart';
import 'package:medapp_assignment/views/schedule_view/moment_content.dart';
import 'package:medapp_assignment/views/schedule_view/moment_content_factory.dart';

class ScheduleViewModel extends ChangeNotifier {
  //! properties

  final List<Moment> _moments = [
    Moment(date: DateTime(2021, 1, 1), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.badTime),
    Moment(date: DateTime(2021, 1, 2), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.badTime),
    Moment(date: DateTime(2021, 1, 3), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.lunch),
    Moment(date: DateTime(2021, 1, 3), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.atWork),
    Moment(date: DateTime(2021, 1, 4), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.breakfast),
    Moment(date: DateTime(2021, 1, 4), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.breakfast),
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

  void setState() {
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
