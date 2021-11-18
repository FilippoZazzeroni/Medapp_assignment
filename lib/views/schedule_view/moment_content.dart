import 'package:flutter/material.dart';
import 'package:medapp_assignment/models/medicine.dart';
import 'package:medapp_assignment/views/schedule_view/moment_content_style.dart';

import 'moment_content_style_factory.dart';

class MomentContent {
  //! init

  MomentContent({required this.title, required this.icon, required this.date, required this.medicines});

  //! properties

  final String title;

  final DateTime date;

  final IconData icon;

  final List<Medicine> medicines;

  bool isCollapsed = false;

  bool isSelected = false;

  MomentContentStyle get contentStyle {
    final styleFactory = MomentContentStyleFactory(isSelected);
    return styleFactory.makeContentStyle();
  }
}
