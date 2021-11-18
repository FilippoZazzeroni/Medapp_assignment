import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medapp_assignment/shared/color_palette.dart';
import 'package:medapp_assignment/supporting_files/constants/font_constants.dart';
import 'package:medapp_assignment/supporting_files/constants/geometry_constants.dart';
import 'package:medapp_assignment/view_models/weekly_medicine_intake_summary_view_model.dart';
import 'package:provider/provider.dart';

class WeeklyMedicineIntakeSummaryView extends StatelessWidget {
  const WeeklyMedicineIntakeSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeeklyMedicineIntakeSummaryViewModel>(builder: (context, viewModel, child) {
      return Padding(
        padding: const EdgeInsets.all(GeometryConstants.mediumMargin),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Weekly in take summary",
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorPalette.primary, fontSize: FontConstant.titleSize),
              ),
              const SizedBox(height: GeometryConstants.mediumMargin),
              Text(_getFormatteDateFrom(viewModel.summaryDate), style: const TextStyle(fontSize: FontConstant.headerSize)),
              const SizedBox(height: GeometryConstants.mediumMargin),
              Text("Number of medicines intake: ${viewModel.getAmountOfMedicineTaken()}", style: const TextStyle(fontSize: FontConstant.headerSize, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    });
  }

  String _getFormatteDateFrom(DateTime dateTime) {
    return DateFormat("EEEE dd MMMM").format(dateTime);
  }
}
