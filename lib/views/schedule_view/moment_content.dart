import 'package:flutter/material.dart';
import 'package:medapp_assignment/views/schedule_view/moment_content_style.dart';

import 'moment_content_style_factory.dart';

class MomentContent {
  //! init

  MomentContent({required this.title, required this.icon, required this.date});

  //! properties

  final String title;

  final DateTime date;

  final IconData icon;

  bool isCollapsed = false;

  bool isSelected = false;

  MomentContentStyle get contentStyle {
    final styleFactory = MomentContentStyleFactory(isSelected);
    return styleFactory.makeContentStyle();
  }
}
