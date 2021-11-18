import 'package:flutter/material.dart';
import 'package:medapp_assignment/supporting_files/constants/font_constants.dart';
import 'package:medapp_assignment/supporting_files/constants/geometry_constants.dart';
import 'package:intl/intl.dart';
import 'moment_content.dart';

class ScheduleListItem extends StatelessWidget {
  const ScheduleListItem({Key? key, required this.momentContent, required this.onClickMomentCallback}) : super(key: key);

  final MomentContent momentContent;

  final Function onClickMomentCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: GeometryConstants.mediumMargin, vertical: GeometryConstants.smallMargin),
      color: momentContent.contentStyle.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(GeometryConstants.borderRadius)),
      elevation: GeometryConstants.cardElevation,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(GeometryConstants.largeMargin),
            child: Icon(momentContent.icon, color: momentContent.contentStyle.contentColor),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  momentContent.title,
                  style: TextStyle(color: momentContent.contentStyle.contentColor, fontSize: FontConstant.headerSize),
                ),
                Text("12:00", style: TextStyle(color: momentContent.contentStyle.contentColor, fontSize: FontConstant.contentSize))
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              onClickMomentCallback();
            },
            icon: Icon(Icons.check_box, color: momentContent.contentStyle.contentColor),
            padding: const EdgeInsets.all(GeometryConstants.largeMargin),
          ),
        ],
      ),
    );
  }
}
