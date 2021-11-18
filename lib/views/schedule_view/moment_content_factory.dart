import 'package:flutter/material.dart';
import 'package:medapp_assignment/models/moment.dart';

import 'moment_content.dart';

class MomentContentFactory {
  //! init

  MomentContentFactory(this.moment);

  //! properties

  final Moment moment;

  //! methods

  MomentContent makeMomentContent() {
    switch (moment.type) {
      case MomentType.breakfast:
        final content = MomentContent(title: "Breakfast", icon: Icons.breakfast_dining, date: moment.date, medicines: moment.medicines);
        content.isSelected = moment.medicines[0].isTaken;
        return content;
      case MomentType.lunch:
        final content = MomentContent(title: "Lunch", icon: Icons.lunch_dining, date: moment.date, medicines: moment.medicines);
        content.isSelected = moment.medicines[0].isTaken;
        return content;
      case MomentType.atWork:
        final content = MomentContent(title: "At work", icon: Icons.work, date: moment.date, medicines: moment.medicines);
        content.isSelected = moment.medicines[0].isTaken;
        return content;
      case MomentType.badTime:
        final content = MomentContent(title: "bed", icon: Icons.bedtime, date: moment.date, medicines: moment.medicines);
        content.isSelected = moment.medicines[0].isTaken;
        return content;
    }
  }
}
