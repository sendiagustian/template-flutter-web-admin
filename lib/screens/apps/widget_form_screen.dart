import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';
import '../../core/widgets/input_widget.dart';

class WidgetFormScreen extends StatefulWidget {
  const WidgetFormScreen({super.key});

  static const String route = "/form-widget";
  static const String name = "Form Widget";
  static const String category = "Widgets";
  static const IconData icon = Icons.article_rounded;

  @override
  State<WidgetFormScreen> createState() => _WidgetFormScreenState();
}

class _WidgetFormScreenState extends State<WidgetFormScreen> {
  TextEditingController datePickerController = TextEditingController();
  TextEditingController timePickerController = TextEditingController();

  FocusNode autocompleteFocusNode = FocusNode();
  TextEditingController autocompleteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppTheme.geometry.large,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Form Widgets",
            style: AppTheme.typography.displayMedium,
          ),
          AppTheme.spacing.customY(24),
          InputWidget.formFieldInput(
            context: context,
            title: "Default Input",
            hintText: "Default Input",
          ),
          AppTheme.spacing.mediumY,
          InputWidget.formFieldInput(
            context: context,
            enabled: false,
            title: "Disable Input",
            hintText: "Disable Input",
          ),
          AppTheme.spacing.mediumY,
          InputWidget.formDateTimeInput(
            controller: datePickerController,
            onTap: () async {
              DateTime? date = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );

              if (date != null) {
                setState(() {
                  datePickerController.value = TextEditingValue(text: date.toString());
                });
              }
            },
            context: context,
            hintText: "Date Picker",
            title: "Date Picker",
          ),
          AppTheme.spacing.mediumY,
          InputWidget.formDateTimeInput(
            controller: timePickerController,
            onTap: () async {
              final TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null && pickedTime != TimeOfDay.now()) {
                setState(() {
                  timePickerController.value = TextEditingValue(text: pickedTime.format(context));
                });
              }
            },
            context: context,
            hintText: "Time Picker",
            title: "Time Picker",
          ),
          AppTheme.spacing.mediumY,
          InputWidget.formAreaInput(
            context: context,
            title: "Default Text Area",
            hintText: "Default Text Area",
          ),
          AppTheme.spacing.mediumY,
          InputWidget.formDropDownInput(
            context: context,
            title: "Drop Down Input",
            hintText: "Drop Down Input",
            onChanged: (value) {},
            items: [
              InputWidget.dropDownItem(
                value: "value1",
                title: "Value 1",
              ),
              InputWidget.dropDownItem(
                value: "value2",
                title: "Value 2",
              ),
              InputWidget.dropDownItem(
                value: "value3",
                title: "Value 3",
              ),
            ],
          ),
          AppTheme.spacing.mediumY,
          InputWidget.formAutocompleteInput(
            context: context,
            title: "Autocomplete Input",
            hintText: "Cari Value",
            onSelected: (value) {},
            options: [
              AutocompleteData(key: "1", value: "value 1"),
              AutocompleteData(key: "2", value: "value 2"),
              AutocompleteData(key: "3", value: "value 3"),
              AutocompleteData(key: "4", value: "value 4"),
              AutocompleteData(key: "5", value: "value 5"),
              AutocompleteData(key: "6", value: "value 6"),
              AutocompleteData(key: "7", value: "value 7"),
              AutocompleteData(key: "8", value: "value 8"),
              AutocompleteData(key: "9", value: "value 9"),
              AutocompleteData(key: "10", value: "value 10"),
              AutocompleteData(key: "11", value: "value 11"),
              AutocompleteData(key: "12", value: "value 12"),
              AutocompleteData(key: "13", value: "value 13"),
              AutocompleteData(key: "14", value: "value 14"),
              AutocompleteData(key: "15", value: "value 15"),
              AutocompleteData(key: "16", value: "value 16"),
              AutocompleteData(key: "17", value: "value 17"),
              AutocompleteData(key: "18", value: "value 18"),
              AutocompleteData(key: "19", value: "value 19"),
              AutocompleteData(key: "20", value: "value 20"),
              AutocompleteData(key: "21", value: "value 21"),
              AutocompleteData(key: "22", value: "value 22"),
              AutocompleteData(key: "23", value: "value 23"),
              AutocompleteData(key: "24", value: "value 24"),
              AutocompleteData(key: "25", value: "value 25"),
              AutocompleteData(key: "26", value: "value 26"),
              AutocompleteData(key: "27", value: "value 27"),
              AutocompleteData(key: "28", value: "value 28"),
              AutocompleteData(key: "29", value: "value 29"),
              AutocompleteData(key: "30", value: "value 30"),
              AutocompleteData(key: "31", value: "value 31"),
              AutocompleteData(key: "32", value: "value 32"),
              AutocompleteData(key: "33", value: "value 33"),
              AutocompleteData(key: "34", value: "value 34"),
              AutocompleteData(key: "35", value: "value 35"),
              AutocompleteData(key: "36", value: "value 36"),
              AutocompleteData(key: "37", value: "value 37"),
              AutocompleteData(key: "38", value: "value 38"),
              AutocompleteData(key: "39", value: "value 39"),
              AutocompleteData(key: "40", value: "value 40"),
              AutocompleteData(key: "41", value: "value 41"),
              AutocompleteData(key: "42", value: "value 42"),
              AutocompleteData(key: "43", value: "value 43"),
              AutocompleteData(key: "44", value: "value 44"),
              AutocompleteData(key: "45", value: "value 45"),
              AutocompleteData(key: "46", value: "value 46"),
              AutocompleteData(key: "47", value: "value 47"),
              AutocompleteData(key: "48", value: "value 48"),
              AutocompleteData(key: "49", value: "value 49"),
              AutocompleteData(key: "50", value: "value 50"),
              AutocompleteData(key: "51", value: "value 51"),
              AutocompleteData(key: "52", value: "value 52"),
              AutocompleteData(key: "53", value: "value 53"),
              AutocompleteData(key: "54", value: "value 54"),
              AutocompleteData(key: "55", value: "value 55"),
              AutocompleteData(key: "56", value: "value 56"),
              AutocompleteData(key: "57", value: "value 57"),
              AutocompleteData(key: "58", value: "value 58"),
              AutocompleteData(key: "59", value: "value 59"),
              AutocompleteData(key: "60", value: "value 60"),
              AutocompleteData(key: "61", value: "value 61"),
              AutocompleteData(key: "62", value: "value 62"),
              AutocompleteData(key: "63", value: "value 63"),
              AutocompleteData(key: "64", value: "value 64"),
              AutocompleteData(key: "65", value: "value 65"),
              AutocompleteData(key: "66", value: "value 66"),
              AutocompleteData(key: "67", value: "value 67"),
              AutocompleteData(key: "68", value: "value 68"),
              AutocompleteData(key: "69", value: "value 69"),
              AutocompleteData(key: "70", value: "value 70"),
              AutocompleteData(key: "71", value: "value 71"),
              AutocompleteData(key: "72", value: "value 72"),
              AutocompleteData(key: "73", value: "value 73"),
              AutocompleteData(key: "74", value: "value 74"),
              AutocompleteData(key: "75", value: "value 75"),
              AutocompleteData(key: "76", value: "value 76"),
              AutocompleteData(key: "77", value: "value 77"),
              AutocompleteData(key: "78", value: "value 78"),
              AutocompleteData(key: "79", value: "value 79"),
              AutocompleteData(key: "80", value: "value 80"),
              AutocompleteData(key: "81", value: "value 81"),
              AutocompleteData(key: "82", value: "value 82"),
              AutocompleteData(key: "83", value: "value 83"),
              AutocompleteData(key: "84", value: "value 84"),
              AutocompleteData(key: "85", value: "value 85"),
              AutocompleteData(key: "86", value: "value 86"),
              AutocompleteData(key: "87", value: "value 87"),
              AutocompleteData(key: "88", value: "value 88"),
              AutocompleteData(key: "89", value: "value 89"),
              AutocompleteData(key: "90", value: "value 90"),
              AutocompleteData(key: "91", value: "value 91"),
              AutocompleteData(key: "92", value: "value 92"),
              AutocompleteData(key: "93", value: "value 93"),
              AutocompleteData(key: "94", value: "value 94"),
              AutocompleteData(key: "95", value: "value 95"),
              AutocompleteData(key: "96", value: "value 96"),
              AutocompleteData(key: "97", value: "value 97"),
              AutocompleteData(key: "98", value: "value 98"),
              AutocompleteData(key: "99", value: "value 99"),
              AutocompleteData(key: "100", value: "value 100"),
            ],
          ),
          const SizedBox(height: 1000),
        ],
      ),
    );
  }
}
