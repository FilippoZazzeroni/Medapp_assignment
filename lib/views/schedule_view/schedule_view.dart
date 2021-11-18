import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:medapp_assignment/shared/color_palette.dart';
import 'package:medapp_assignment/supporting_files/constants/font_constants.dart';
import 'package:medapp_assignment/supporting_files/constants/geometry_constants.dart';
import 'package:medapp_assignment/view_models/schedule_view_model.dart';
import 'package:medapp_assignment/views/schedule_view/moment_content.dart';
import 'package:medapp_assignment/views/schedule_view/schedule_list_item.dart';
import 'package:provider/provider.dart';

class ScheduleView extends StatelessWidget {
  //! init

  const ScheduleView({Key? key}) : super(key: key);

  //! methods

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScheduleViewModel(),
      child: Scaffold(
        backgroundColor: ColorPalette.background,
        body: Consumer<ScheduleViewModel>(builder: (context, viewModel, child) {
          return GroupedListView(
              elements: viewModel.contents.keys.toList(),
              groupBy: (MomentContent content) => content.date,
              groupHeaderBuilder: (MomentContent content) {
                return Padding(
                    padding: const EdgeInsets.all(GeometryConstants.mediumMargin),
                    child: Text(
                      _getFormatteDateFrom(content.date),
                      style: const TextStyle(fontSize: FontConstant.headerSize),
                    ));
              },
              groupSeparatorBuilder: (DateTime date) {
                return Text(_getFormatteDateFrom(date));
              },
              itemBuilder: (context, MomentContent content) {
                return ScheduleListItem(
                    onCardClickCallback: () {
                      content.isCollapsed = !content.isCollapsed;
                      viewModel.setState();
                    },
                    onClickMomentCallback: () {
                      content.isSelected = !content.isSelected;
                      viewModel.setMomentState(content);
                    },
                    momentContent: content);
              });
        }),
      ),
    );
  }

  String _getFormatteDateFrom(DateTime dateTime) {
    return DateFormat("EEEE dd MMMM").format(dateTime);
  }
}
