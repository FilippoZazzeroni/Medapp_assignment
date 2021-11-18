import 'package:flutter/material.dart';
import 'package:medapp_assignment/shared/color_palette.dart';

abstract class MomentContentStyle {
  abstract final Color backgroundColor;

  /// The color of all the content. it inclueds the icons and the text
  abstract final Color contentColor;
}

class SelectedMomentContentStyle implements MomentContentStyle {
  @override
  final Color backgroundColor = ColorPalette.primary;

  @override
  final Color contentColor = Colors.white;
}

class UnselectedMomentContentStyle implements MomentContentStyle {
  @override
  final Color backgroundColor = ColorPalette.secondary;

  @override
  final Color contentColor = Colors.black;
}
