import 'package:flutter/material.dart';
import 'package:medapp_assignment/models/medicine.dart';
import 'package:medapp_assignment/shared/color_palette.dart';
import 'package:medapp_assignment/supporting_files/constants/font_constants.dart';
import 'package:medapp_assignment/supporting_files/constants/geometry_constants.dart';
import 'moment_content.dart';

class ScheduleListItem extends StatelessWidget {
  const ScheduleListItem({Key? key, required this.momentContent, required this.onClickMomentCallback, required this.onCardClickCallback}) : super(key: key);

  final MomentContent momentContent;

  final Function onClickMomentCallback;

  final Function onCardClickCallback;

  @override
  Widget build(BuildContext context) {
    final medicineWidgets = <Widget>[];
    for (var medicine in momentContent.medicines) {
      medicineWidgets.add(_makeCollapasbleItemFrom(medicine));
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: GeometryConstants.smallMargin),
      child: GestureDetector(
        onTap: () {
          onCardClickCallback();
        },
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: GeometryConstants.mediumMargin),
              color: momentContent.contentStyle.backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: momentContent.isCollapsed ? const Radius.circular(0) : const Radius.circular(GeometryConstants.borderRadius),
                      bottomLeft: momentContent.isCollapsed ? const Radius.circular(0) : const Radius.circular(GeometryConstants.borderRadius),
                      topLeft: const Radius.circular(GeometryConstants.borderRadius),
                      topRight: const Radius.circular(GeometryConstants.borderRadius))),
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
            ),
            if (momentContent.isCollapsed)
              Card(
                color: ColorPalette.secondary,
                margin: const EdgeInsets.symmetric(horizontal: GeometryConstants.mediumMargin),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(GeometryConstants.borderRadius), bottomRight: Radius.circular(GeometryConstants.borderRadius))),
                child: Column(
                  children: [
                    Container(
                      color: momentContent.contentStyle.collapsedStyle.iconColor,
                      height: 5,
                    ),
                    ...medicineWidgets,
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _makeCollapasbleItemFrom(Medicine medicine) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: GeometryConstants.largeMargin, vertical: GeometryConstants.largeMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicine.name,
                  style: const TextStyle(fontSize: FontConstant.headerSize),
                ),
                Text(medicine.description, style: const TextStyle(fontSize: FontConstant.contentSize))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(GeometryConstants.largeMargin),
          child: Icon(
            Icons.check_circle_outline,
            color: momentContent.contentStyle.collapsedStyle.iconColor,
          ),
        )
      ],
    );
  }
}
