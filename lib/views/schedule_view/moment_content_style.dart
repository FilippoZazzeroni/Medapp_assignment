import 'package:flutter/material.dart';
import 'package:medapp_assignment/shared/color_palette.dart';

abstract class MomentContentStyle {
  abstract final Color backgroundColor;

  /// The color of all the content. it inclueds the icons and the text
  abstract final Color contentColor;

  abstract final CollapsedStyle collapsedStyle;
}

abstract class CollapsedStyle {
  abstract final Color iconColor;
}

class SelectedMomentContentStyle implements MomentContentStyle {
  @override
  final Color backgroundColor = ColorPalette.primary;

  @override
  final Color contentColor = Colors.white;

  @override
  final CollapsedStyle collapsedStyle = SelectedCollapsedStyle();
}

class SelectedCollapsedStyle implements CollapsedStyle {
  @override
  final Color iconColor = ColorPalette.mantis;
}

class UnselectedMomentContentStyle implements MomentContentStyle {
  @override
  final Color backgroundColor = ColorPalette.secondary;

  @override
  final Color contentColor = Colors.black;

  @override
  final CollapsedStyle collapsedStyle = UnselectedCollapsedStyle();
}

class UnselectedCollapsedStyle implements CollapsedStyle {
  @override
  final Color iconColor = Colors.grey;
}
