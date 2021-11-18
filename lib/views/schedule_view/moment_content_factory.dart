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
        return MomentContent(title: "Breakfast", icon: Icons.breakfast_dining, date: moment.date);
      case MomentType.lunch:
        return MomentContent(title: "Lunch", icon: Icons.lunch_dining, date: moment.date);
      case MomentType.atWork:
        return MomentContent(title: "At work", icon: Icons.work, date: moment.date);
      case MomentType.badTime:
        return MomentContent(title: "bed", icon: Icons.bedtime, date: moment.date);
    }
  }
}
