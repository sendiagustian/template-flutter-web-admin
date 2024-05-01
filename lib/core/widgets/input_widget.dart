import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_theme.dart';

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
                  style: titleStyle ?? AppTheme.typography.titleMedium,
                ),
                AppTheme.spacing.mediumY,
              ],
            );
          }
          return const SizedBox();
        }),
        Container(
          color: Colors.white,
          child: Row(
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
                    contentPadding: (maxLines != null && maxLines > 1) ? AppTheme.geometry.small : AppTheme.geometry.smallX,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.8,
                        color: Colors.grey[600]!,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.8,
                        color: Colors.grey[400]!,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.8,
                        color: AppTheme.colors.primary,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
    bool? filled = true,
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
          style: titleStyle ?? AppTheme.typography.titleMedium,
        ),
        AppTheme.spacing.mediumY,
        Container(
          color: Colors.white,
          child: Row(
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
                    filled: filled,
                    hoverColor: Colors.white,
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                    hintText: hintText,
                    fillColor: enabled ? Colors.white : Colors.grey[100],
                    hintStyle: hintStyle ?? AppTheme.typography.bodyMediumHint,
                    contentPadding: AppTheme.geometry.custom(top: 8.r, right: 6.r, left: 6.r, bottom: 8.r),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.8,
                        color: Colors.grey[600]!,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.8,
                        color: Colors.grey[400]!,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.8,
                        color: AppTheme.colors.primary,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget formDateTimeInput({
    required BuildContext context,
    bool filled = false,
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
            style: titleStyle ?? AppTheme.typography.titleMedium,
          ),
        ),
        AppTheme.spacing.mediumY,
        Container(
          color: Colors.white,
          child: TextFormField(
            readOnly: true,
            controller: controller,
            onTap: onTap,
            style: AppTheme.typography.bodyMedium,
            decoration: InputDecoration(
              filled: filled,
              fillColor: enabled ? Colors.white : Colors.grey[100],
              contentPadding: AppTheme.geometry.smallX,
              suffixIcon: IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.calendar_month),
              ),
              hintText: hintText,
              hintStyle: AppTheme.typography.bodyMediumHint,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                  color: AppTheme.colors.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget formDropDownInput<T>({
    required BuildContext context,
    bool filled = false,
    T? value,
    required String title,
    required String hintText,
    required Function(dynamic)? onChanged,
    String? Function(dynamic)? validator,
    required List<DropdownMenuItem<T>> items,
    double? height = 50,
    bool enabled = true,
    Widget? suffixIcon,
    Widget? prefixIcon,
    List<Widget> Function(BuildContext)? selectedItemBuilder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.typography.titleMedium,
        ),
        AppTheme.spacing.mediumY,
        Container(
          color: Colors.white,
          height: height,
          child: DropdownButtonFormField<T>(
            value: value,
            padding: EdgeInsets.zero,
            items: items,
            isExpanded: true,
            onChanged: enabled ? onChanged : null,
            validator: validator,
            style: AppTheme.typography.bodyMedium,
            decoration: InputDecoration(
              filled: filled,
              fillColor: enabled ? Colors.white : Colors.grey[100],
              contentPadding: AppTheme.geometry.smallX,
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintStyle: AppTheme.typography.bodyMediumHint,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                  color: Colors.grey[600]!,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                  color: Colors.grey[400]!,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                  color: AppTheme.colors.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
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
    TextStyle? titleStyle,
    double maxHeightOption = 200,
    required void Function(String)? onSelected,
    required List<AutocompleteData> options,
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
                style: titleStyle ?? AppTheme.typography.titleMedium,
              ),
            ),
            AppTheme.spacing.mediumY,
            RawAutocomplete<String>(
              onSelected: onSelected,
              optionsBuilder: (TextEditingValue textEditingValue) {
                List<AutocompleteData> data = options.where((element) {
                  return element.value.toLowerCase().contains(textEditingValue.text.toLowerCase());
                }).toList();
                return data.map((e) => e.value).toList();
              },
              fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                return formFieldInput(
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  focusNode: focusNode,
                  controller: textEditingController,
                  context: context,
                  hintText: hintText,
                );
              },
              optionsViewBuilder: (context, onSelected, options) {
                return Container(
                  margin: AppTheme.geometry.exSmallT,
                  alignment: Alignment.topLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: maxHeightOption, maxWidth: constraints.maxWidth),
                    child: Material(
                      elevation: 4,
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: options.map((e) {
                            return ListTile(
                              title: Text(e),
                              onTap: () => onSelected(e),
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

  static DropdownMenuItem dropDownItem<T>({
    required String value,
    required String title,
  }) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        title,
        style: AppTheme.typography.bodyMedium,
      ),
    );
  }
}

class AutocompleteData {
  final String key;
  final String value;
  AutocompleteData({required this.key, required this.value});
}
