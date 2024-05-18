import 'package:flutter/material.dart';

import '../enums/type_enums.dart';
import '../extensions/color_extension.dart';
import '../themes/app_theme.dart';
import '../utils/app_util.dart';
import 'button_widget.dart';
import 'card_widget.dart';
import 'hovers/table_row_hover_widget.dart';
import 'input_widget.dart';
import 'pagination_widget.dart';

class TableWidget {
  static Widget headColumn({
    required List<ColumnItem> columns,
    Color? color,
    double maxHeight = 100.0,
  }) {
    return Container(
      padding: AppTheme.geometry.medium,
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFf7f9fc),
        borderRadius: AppTheme.radius.custom(topLeft: 4.0, topRight: 4.0),
      ),
      child: Row(
        children: List.generate(
          columns.length,
          (index) {
            ColumnItem column = columns[index];
            if (column.isVisible) {
              return Expanded(
                child: Container(
                  padding: AppTheme.geometry.exSmall,
                  child: Text(
                    column.title,
                    textAlign: column.textAlign,
                    style: AppTheme.typography.labelLarge.copyWith(
                      color: color?.getTextColor(),
                    ),
                  ),
                ),
              );
            }
            return const Expanded(child: SizedBox());
          },
        ),
      ),
    );
  }

  static Widget card<T>({
    required BuildContext context,
    required String title,
    required List<ColumnItem> columns,
    required List<RowItem> data,
    List<BoxShadow>? boxShadow,
    String? addText,
    void Function()? onTapAdd,
    double maxLargeScreenWidth = 1505,
    double maxMediumScreenWidth = 1000,
    double maxSmallScreenWidth = 800,
    double maxHeight = double.infinity,
    double columnHeight = 100.0,
    Color? columnBackgroundColor,
    SearchProps? searchProps,
    PaginationProps? paginationProps,
  }) {
    double getMaxWidthTable() {
      if (isSmallScreen(context)) {
        return maxSmallScreenWidth;
      } else if (isMediumScreen(context)) {
        return maxMediumScreenWidth;
      } else {
        return maxLargeScreenWidth;
      }
    }

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: double.infinity),
      child: CardWidget.basic(
        title: title,
        boxShadow: boxShadow,
        withSeparator: false,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                if (searchProps != null) {
                  if (isLargeScreen(context)) {
                    return Container(
                      margin: AppTheme.geometry.mediumB,
                      width: isSmallScreen(context) ? double.infinity : 400,
                      child: InputWidget.formFieldInput(
                        context: context,
                        controller: searchProps.controller,
                        hintText: searchProps.hintText,
                        prefixIcon: const Icon(Icons.search),
                        onChanged: searchProps.onChanged,
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Container(
                        margin: AppTheme.geometry.mediumB,
                        width: isSmallScreen(context) ? double.infinity : 400,
                        child: InputWidget.formFieldInput(
                          context: context,
                          controller: searchProps.controller,
                          hintText: searchProps.hintText,
                          prefixIcon: const Icon(Icons.search),
                          onChanged: searchProps.onChanged,
                        ),
                      ),
                    );
                  }
                } else {
                  return const SizedBox();
                }
              }),
              isLargeScreen(context) ? const Expanded(child: SizedBox()) : const SizedBox(width: 16),
              if (addText != null)
                Container(
                  margin: AppTheme.geometry.mediumB,
                  child: ButtonWidget.build(text: addText, type: ButtonType.primary, onPressed: onTapAdd),
                ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: getMaxWidthTable(),
              child: Column(
                children: [
                  headColumn(
                    columns: columns,
                    maxHeight: columnHeight,
                    color: columnBackgroundColor,
                  ),
                  ...List.generate(data.length, (index) {
                    RowItem row = data[index];
                    return TableRowHoverWidget(
                      columns: columns,
                      data: row,
                      hoverColor: Colors.grey[100]!,
                      isFirstIndex: index == 0,
                      isLastIndex: (index == (data.length - 1)),
                    );
                  }),
                ],
              ),
            ),
          ),
          AppTheme.spacing.smallY,
          Builder(builder: (context) {
            if (paginationProps != null) {
              int threshold;
              if (paginationProps.threshold != null) {
                threshold = paginationProps.threshold!;
              } else {
                if (isLargeScreen(context)) {
                  threshold = 12;
                } else if (isMediumScreen(context)) {
                  threshold = 8;
                } else {
                  threshold = 5;
                }
              }
              return SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: PaginationWidget(
                    buttonElevation: 2,
                    colorSelectedButton: AppTheme.colors.primary,
                    threshold: threshold,
                    pageInit: paginationProps.currentPage,
                    pageTotal: paginationProps.totalPage,
                    onPageChanged: paginationProps.onPageChanged,
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
        ],
      ),
    );
  }

  static Widget basic<T>({
    required BuildContext context,
    required String title,
    required List<ColumnItem> columns,
    required List<RowItem> data,
    List<BoxShadow>? boxShadow,
    String? addText,
    void Function()? onTapAdd,
    void Function()? onTap,
    Color? columnBackgroundColor,
    double maxLargeScreenWidth = 1537,
    double maxMediumScreenWidth = 1000,
    double maxSmallScreenWidth = 800,
    double maxHeight = double.infinity,
    double columnHeight = 100.0,
    SearchProps? searchProps,
  }) {
    double getMaxWidthTable() {
      if (isSmallScreen(context)) {
        return maxSmallScreenWidth;
      } else if (isMediumScreen(context)) {
        return maxMediumScreenWidth;
      } else {
        return maxLargeScreenWidth;
      }
    }

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: double.infinity),
      decoration: BoxDecoration(boxShadow: boxShadow ?? AppTheme.boxShadows.basic),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.typography.titleMedium,
          ),
          AppTheme.spacing.mediumY,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                if (searchProps != null) {
                  if (isLargeScreen(context)) {
                    return Container(
                      margin: AppTheme.geometry.mediumB,
                      width: isSmallScreen(context) ? double.infinity : 400,
                      child: InputWidget.formFieldInput(
                        context: context,
                        controller: searchProps.controller,
                        hintText: searchProps.hintText,
                        prefixIcon: const Icon(Icons.search),
                        onChanged: searchProps.onChanged,
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Container(
                        margin: AppTheme.geometry.mediumB,
                        width: isSmallScreen(context) ? double.infinity : 400,
                        child: InputWidget.formFieldInput(
                          context: context,
                          controller: searchProps.controller,
                          hintText: searchProps.hintText,
                          prefixIcon: const Icon(Icons.search),
                          onChanged: searchProps.onChanged,
                        ),
                      ),
                    );
                  }
                } else {
                  return const SizedBox();
                }
              }),
              isLargeScreen(context) ? const Expanded(child: SizedBox()) : const SizedBox(width: 16),
              if (addText != null)
                Container(
                  margin: AppTheme.geometry.mediumB,
                  child: ButtonWidget.build(text: addText, type: ButtonType.primary, onPressed: onTapAdd),
                ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: getMaxWidthTable(),
              child: Column(
                children: [
                  headColumn(
                    columns: columns,
                    color: columnBackgroundColor,
                    maxHeight: columnHeight,
                  ),
                  ...List.generate(data.length, (index) {
                    RowItem row = data[index];
                    return TableRowHoverWidget(
                      data: row,
                      columns: columns,
                      hoverColor: Colors.grey[100]!,
                      isFirstIndex: index == 0,
                      isLastIndex: (index == (data.length - 1)),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchProps {
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;

  SearchProps({
    required this.hintText,
    required this.controller,
    required this.onChanged,
  });
}

class PaginationProps {
  int? threshold;
  int totalPage;
  int currentPage;
  Function(int) onPageChanged;

  PaginationProps({
    this.threshold,
    required this.totalPage,
    required this.currentPage,
    required this.onPageChanged,
  });
}

class ColumnItem {
  final String title;
  final bool isVisible;
  final TextAlign textAlign;

  ColumnItem({
    required this.title,
    this.isVisible = true,
    this.textAlign = TextAlign.left,
  });
}

class RowItem {
  final Map<String, dynamic> rowData;
  final void Function()? onTap;

  RowItem({
    required this.rowData,
    this.onTap,
  });
}
