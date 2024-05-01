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
  final _formKey = GlobalKey<FormState>();

  TextEditingController datePickerController = TextEditingController();
  TextEditingController timePickerController = TextEditingController();

  FocusNode autocompleteFocusNode = FocusNode();
  TextEditingController autocompleteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppTheme.geometry.large,
        child: Form(
          key: _formKey,
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
                  AutocompleteData(key: "2", value: "value 2"),
                  AutocompleteData(key: "3", value: "value 3"),
                  AutocompleteData(key: "4", value: "value 4"),
                  AutocompleteData(key: "5", value: "value 5"),
                  AutocompleteData(key: "6", value: "value 6"),
                  AutocompleteData(key: "7", value: "value 7"),
                  AutocompleteData(key: "8", value: "value 8"),
                  AutocompleteData(key: "9", value: "value 9"),
                  AutocompleteData(key: "10", value: "value 10"),
                ],
              ),
              const SizedBox(height: 300),
            ],
          ),
        ),
      ),
    );
  }
}
