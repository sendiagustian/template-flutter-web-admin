import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../themes/app_theme.dart';
import 'customs/text_field_otp_custom_widget.dart';
import 'hovers/input_file_hover_widget.dart';

class InputWidget {
  const InputWidget();

  static Widget formFieldInput({
    required BuildContext context,
    String? title,
    TextStyle? titleStyle,
    TextStyle? hintStyle,
    required String hintText,
    bool? filled = true,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function()? onTap,
    Function(String)? onChanged,
    bool enabled = true,
    bool autofocus = false,
    bool obscureText = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Widget? leading,
    FocusNode? focusNode,
    int? maxLines = 1,
    int? maxLength,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          if (title != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleStyle ?? AppTheme.typography.labelLarge,
                ),
                AppTheme.spacing.smallY,
              ],
            );
          }
          return const SizedBox();
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading ?? Container(),
            Expanded(
              child: TextFormField(
                autofocus: autofocus,
                obscureText: obscureText,
                onTap: onTap,
                onChanged: onChanged,
                controller: controller,
                validator: validator,
                enabled: enabled,
                focusNode: focusNode,
                maxLength: maxLength,
                maxLines: maxLines,
                textCapitalization: textCapitalization,
                keyboardType: keyboardType,
                style: AppTheme.typography.bodyMedium,
                decoration: InputDecoration(
                  filled: filled,
                  hoverColor: Colors.white,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  hintText: hintText,
                  fillColor: enabled ? Colors.white : Colors.grey[100],
                  hintStyle: hintStyle ?? AppTheme.typography.bodyMediumHint,
                  contentPadding: (maxLines != null && maxLines > 1)
                      ? AppTheme.geometry.small
                      : AppTheme.geometry.custom(
                          top: 10,
                          right: 16,
                          left: 16,
                          bottom: 10,
                        ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.8,
                      color: Colors.grey[600]!,
                    ),
                    borderRadius: AppTheme.radius.exSmall,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.8,
                      color: Colors.grey[400]!,
                    ),
                    borderRadius: AppTheme.radius.exSmall,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.8,
                      color: AppTheme.colors.primary,
                    ),
                    borderRadius: AppTheme.radius.exSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget formAreaInput({
    required BuildContext context,
    required String title,
    TextStyle? titleStyle,
    TextStyle? hintStyle,
    TextStyle? counterStyle,
    required String hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function()? onTap,
    Function(String)? onChanged,
    bool enabled = true,
    bool obscureText = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Widget? leading,
    FocusNode? focusNode,
    int? maxLength,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ?? AppTheme.typography.labelLarge,
        ),
        AppTheme.spacing.smallY,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading ?? Container(),
            Expanded(
              child: TextFormField(
                obscureText: obscureText,
                onTap: onTap,
                onChanged: onChanged,
                controller: controller,
                validator: validator,
                enabled: enabled,
                focusNode: focusNode,
                maxLength: maxLength,
                maxLines: 5,
                textCapitalization: textCapitalization,
                keyboardType: keyboardType,
                style: AppTheme.typography.bodyMedium,
                decoration: InputDecoration(
                  filled: true,
                  hoverColor: Colors.white,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  hintText: hintText,
                  counterStyle: counterStyle ?? AppTheme.typography.bodySmall,
                  fillColor: enabled ? Colors.white : Colors.grey[100],
                  hintStyle: hintStyle ?? AppTheme.typography.bodyMediumHint,
                  contentPadding: AppTheme.geometry.custom(top: 24, right: 16, left: 16, bottom: 8),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.8,
                      color: Colors.grey[600]!,
                    ),
                    borderRadius: AppTheme.radius.exSmall,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.8,
                      color: Colors.grey[400]!,
                    ),
                    borderRadius: AppTheme.radius.exSmall,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.8,
                      color: AppTheme.colors.primary,
                    ),
                    borderRadius: AppTheme.radius.exSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget formDateTimeInput({
    required BuildContext context,
    bool enabled = true,
    TextStyle? titleStyle,
    required String hintText,
    Function()? onTap,
    required String title,
    Function()? onPressed,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: titleStyle ?? AppTheme.typography.labelLarge,
          ),
        ),
        AppTheme.spacing.smallY,
        TextFormField(
          readOnly: true,
          controller: controller,
          onTap: onTap,
          style: AppTheme.typography.bodyMedium,
          decoration: InputDecoration(
            filled: true,
            fillColor: enabled ? Colors.white : Colors.grey[100],
            contentPadding: AppTheme.geometry.custom(
              top: 10,
              right: 16,
              left: 16,
              bottom: 10,
            ),
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.calendar_month),
            ),
            hintText: hintText,
            hintStyle: AppTheme.typography.bodyMediumHint,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.8,
                color: Colors.grey[600]!,
              ),
              borderRadius: AppTheme.radius.exSmall,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.8,
                color: Colors.grey[400]!,
              ),
              borderRadius: AppTheme.radius.exSmall,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.8,
                color: AppTheme.colors.primary,
              ),
              borderRadius: AppTheme.radius.exSmall,
            ),
          ),
        ),
      ],
    );
  }

  static Widget formDropDownInput<T>({
    required BuildContext context,
    required T? value,
    String? title,
    TextStyle? titleStyle,
    required String hintText,
    required void Function(T?)? onChanged,
    String? Function(T?)? validator,
    required List<DropdownMenuItem<T>> items,
    double maxHeightOption = 200,
    double? height = 50,
    bool enabled = true,
    Widget? suffixIcon,
    Widget? prefixIcon,
    List<Widget> Function(BuildContext)? selectedItemBuilder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          if (title != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleStyle ?? AppTheme.typography.labelLarge,
                ),
                AppTheme.spacing.smallY,
              ],
            );
          }
          return const SizedBox();
        }),
        DropdownButtonFormField<T>(
          value: value,
          padding: EdgeInsets.zero,
          isExpanded: true,
          items: items,
          onChanged: enabled ? onChanged : null,
          validator: validator,
          style: AppTheme.typography.bodyMedium,
          selectedItemBuilder: selectedItemBuilder,
          menuMaxHeight: maxHeightOption,
          hint: Text(
            hintText,
            style: AppTheme.typography.bodyMediumHint,
          ),
          decoration: InputDecoration(
            filled: true,
            hoverColor: Colors.white,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            fillColor: enabled ? Colors.white : Colors.grey[100],
            contentPadding: AppTheme.geometry.custom(
              top: 10,
              right: 4,
              left: 0,
              bottom: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.8,
                color: Colors.grey[600]!,
              ),
              borderRadius: AppTheme.radius.exSmall,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.8,
                color: Colors.grey[400]!,
              ),
              borderRadius: AppTheme.radius.exSmall,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.8,
                color: AppTheme.colors.primary,
              ),
              borderRadius: AppTheme.radius.exSmall,
            ),
          ),
        ),
      ],
    );
  }

  static Widget formAutocompleteInput({
    required BuildContext context,
    required String title,
    required String hintText,
    required String? value,
    TextStyle? titleStyle,
    double maxHeightOption = 200,
    required void Function(AutocompleteData?)? onSelected,
    required List<AutocompleteData> dataOptions,
  }) {
    final ScrollController scrollController = ScrollController();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: titleStyle ?? AppTheme.typography.labelLarge,
              ),
            ),
            AppTheme.spacing.smallY,
            RawAutocomplete<String>(
              initialValue: value == null
                  ? null
                  : TextEditingValue(text: dataOptions.where((element) => element.key == value).first.value),
              optionsBuilder: (TextEditingValue textEditingValue) {
                List<AutocompleteData> data = dataOptions.where((element) {
                  return element.value.toLowerCase().contains(textEditingValue.text.toLowerCase());
                }).toList();
                return data.map((e) => e.value).toList();
              },
              fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                return formFieldInput(
                  onTap: () => textEditingController.clear(),
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  focusNode: focusNode,
                  controller: textEditingController,
                  context: context,
                  hintText: hintText,
                );
              },
              optionsViewBuilder: (context, onSelectedAutocomplete, options) {
                return Container(
                  margin: AppTheme.geometry.exSmallT,
                  alignment: Alignment.topLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: maxHeightOption, maxWidth: constraints.maxWidth),
                    child: Material(
                      elevation: 4,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: AppTheme.radius.exSmall,
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: options.map<Widget>((option) {
                            final AutocompleteData data = dataOptions.firstWhere((element) => element.value == option);
                            return ListTile(
                              title: Text(data.value),
                              onTap: () {
                                onSelectedAutocomplete(data.value);
                                onSelected!(data);
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  static DropdownMenuItem<T> dropDownItem<T>({
    required T value,
    required String title,
  }) {
    return DropdownMenuItem<T>(
      value: value,
      child: Text(
        title,
        style: AppTheme.typography.bodyMedium,
      ),
    );
  }

  static Widget formFileInput({
    required String? title,
    required PlatformFile? file,
    required void Function()? onTap,
    TextStyle? titleStyle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          if (title != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleStyle ?? AppTheme.typography.labelLarge,
                ),
                AppTheme.spacing.smallY,
              ],
            );
          }
          return const SizedBox();
        }),
        InputFileHoverWidget(file: file, onTap: onTap),
      ],
    );
  }

  static Widget formOTPInput({required int length, required ValueChanged<String> onCompleted}) {
    return TextFieldOtpCustomWidget(
      length: length,
      fieldWidth: 50,
      contentPadding: EdgeInsets.zero,
      outlineBorderRadius: AppTheme.double.doubleX4,
      style: AppTheme.typography.bodyMedium,
      textFieldAlignment: MainAxisAlignment.spaceAround,
      onCompleted: (code) {
        onCompleted(code);
      },
    );
  }

  static Widget formRadioGroupInput<T>({
    required String title,
    required T group,
    required List<RadioItemData<T>> items,
    Axis direction = Axis.horizontal,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.typography.labelLarge.copyWith(color: Colors.white),
        ),
        Builder(builder: (context) {
          if (direction == Axis.horizontal) {
            return Row(
              children: items.map((item) {
                return Row(
                  children: [
                    Radio<T>(
                      value: item.value,
                      fillColor: WidgetStateColor.resolveWith(
                        (states) => Colors.white,
                      ),
                      groupValue: group,
                      onChanged: item.onChanged,
                    ),
                    GestureDetector(
                      onTap: () {
                        item.onChanged(item.value);
                      },
                      child: Text(
                        item.value.toString(),
                        style: AppTheme.typography.bodyMedium.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                );
              }).toList(),
            );
          } else {
            return Column(
              children: items.map((item) {
                return Row(
                  children: [
                    Radio<T>(
                      value: item.value,
                      fillColor: WidgetStateColor.resolveWith(
                        (states) => Colors.white,
                      ),
                      groupValue: group,
                      onChanged: item.onChanged,
                    ),
                    GestureDetector(
                      onTap: () {
                        item.onChanged(item.value);
                      },
                      child: Text(
                        item.value.toString(),
                        style: AppTheme.typography.bodyMedium.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                );
              }).toList(),
            );
          }
        }),
      ],
    );
  }
}

class AutocompleteData {
  final String key;
  final String value;

  AutocompleteData({required this.key, required this.value});
}

class RadioItemData<T> {
  final T value;
  final void Function(T?) onChanged;

  RadioItemData({required this.value, required this.onChanged});
}
