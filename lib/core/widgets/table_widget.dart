import 'package:flutter/material.dart';

import '../extensions/color_extension.dart';
import '../themes/app_theme.dart';
import '../utils/layout_util.dart';
import 'card_widget.dart';
import 'input_widget.dart';
import 'pagination_widget.dart';

class TableWidget {
  static Widget headColumn({
    required List<ColumnItem> columns,
    Color? color = const Color(0xFFf7f9fc),
    double maxHeight = 100.0,
  }) {
    return Container(
      padding: AppTheme.geometry.small,
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: BoxDecoration(
        color: color,
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

  static Widget rowData({
    required List<ColumnItem> columns,
    required Map<String, dynamic> data,
    required bool isFirstIndex,
    required bool isLastIndex,
    Color? color,
    double maxHeight = 80.0,
    double maxWidth = double.infinity,
  }) {
    return Container(
      padding: AppTheme.geometry.small,
      constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: maxWidth),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: AppTheme.radius.custom(bottomLeft: isLastIndex ? 4.0 : 0.0, bottomRight: isLastIndex ? 4.0 : 0.0),
        border: Border(
          bottom: isLastIndex ? BorderSide.none : BorderSide(color: Colors.grey[200]!, width: 1.0),
        ),
      ),
      child: Row(
        children: [
          ...List.generate(
            columns.length,
            (index) {
              ColumnItem column = columns[index];
              dynamic value = data[column.title];
              if (column.isVisible) {
                return Expanded(
                  child: Container(
                    padding: AppTheme.geometry.exSmall,
                    child: Text(
                      data[column.title].toString(),
                      textAlign: column.textAlign,
                      style: AppTheme.typography.bodySmall,
                    ),
                  ),
                );
              } else {
                if (value is List<Widget>) {
                  return Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: value,
                    ),
                  );
                } else if (value is Widget) {
                  return Expanded(
                    child: value,
                  );
                } else {
                  return const Expanded(child: SizedBox());
                }
              }
            },
          ),
        ],
      ),
    );
  }

  static Widget card({
    required BuildContext context,
    required String title,
    required List<ColumnItem> columns,
    required List<Map<String, dynamic>> data,
    double maxLargeScreenWidth = 1500,
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
        withSeparator: false,
        children: [
          Builder(builder: (context) {
            if (searchProps != null) {
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
              return const SizedBox();
            }
          }),
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
                    Map<String, dynamic> row = data[index];
                    return rowData(
                      columns: columns,
                      data: row,
                      isFirstIndex: false,
                      isLastIndex: (index == (data.length - 1)),
                    );
                  }),
                ],
              ),
            ),
          ),
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

  static Widget basic({
    required BuildContext context,
    required String title,
    required List<ColumnItem> columns,
    required List<Map<String, dynamic>> data,
    Color? columnBackgroundColor,
    double maxLargeScreenWidth = 1500,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.typography.titleMedium,
          ),
          AppTheme.spacing.mediumY,
          Builder(builder: (context) {
            if (searchProps != null) {
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
              return const SizedBox();
            }
          }),
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
                    Map<String, dynamic> row = data[index];
                    return rowData(
                      data: row,
                      columns: columns,
                      color: Colors.white,
                      isFirstIndex: false,
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
