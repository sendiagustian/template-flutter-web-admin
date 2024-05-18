import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../themes/app_theme.dart';
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
                  style: titleStyle ?? AppTheme.typography.titleSmall,
                ),
                AppTheme.spacing.exSmallY,
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
          style: titleStyle ?? AppTheme.typography.titleSmall,
        ),
        AppTheme.spacing.exSmallY,
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
            style: titleStyle ?? AppTheme.typography.titleSmall,
          ),
        ),
        AppTheme.spacing.exSmallY,
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
    required String title,
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
        Text(title, style: AppTheme.typography.titleMedium),
        AppTheme.spacing.exSmallY,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: titleStyle ?? AppTheme.typography.titleSmall,
              ),
            ),
            AppTheme.spacing.exSmallY,
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
                  style: titleStyle ?? AppTheme.typography.titleSmall,
                ),
                AppTheme.spacing.exSmallY,
              ],
            );
          }
          return const SizedBox();
        }),
        InputFileHoverWidget(file: file, onTap: onTap),
      ],
    );
  }

  static Widget formOTPInput({required int length, required void Function(String) onComplete}) {
    List<FocusNode> focusNodes = List.generate(length, (index) => FocusNode());
    List<TextEditingController> controllers = List.generate(length, (index) => TextEditingController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(length, (index) {
        bool isFirst = index == 0;
        bool isLast = index == length - 1;

        return Container(
          width: 50,
          margin: isLast ? EdgeInsets.zero : const EdgeInsets.only(right: 4),
          child: TextField(
            textAlign: TextAlign.center,
            focusNode: focusNodes[index],
            controller: controllers[index],
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value.isNotEmpty && !isLast) {
                focusNodes[index + 1].requestFocus();
              }
              if (value.isEmpty && !isFirst) {
                focusNodes[index - 1].requestFocus();
              }
              if (value.isNotEmpty && isLast) {
                focusNodes[index].unfocus();
              }
              String codeResult = '';
              for (var controller in controllers) {
                codeResult += controller.text;
              }
              onComplete(codeResult);
            },
          ),
        );
      }),
    );
  }
}

class AutocompleteData {
  final String key;
  final String value;
  AutocompleteData({required this.key, required this.value});
}
