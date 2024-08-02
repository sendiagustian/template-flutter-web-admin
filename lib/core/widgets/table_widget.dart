import 'package:flutter/material.dart';

import '../constants/enums/type_enums.dart';
import '../extensions/color_extension.dart';
import '../themes/app_theme.dart';
import '../utils/app_util.dart';
import 'button_widget.dart';
import 'hovers/table_row_hover_widget.dart';
import 'input_widget.dart';
import 'customs/pagination_custom_widget.dart';

class TableWidget {
  static Widget _headColumn({
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
                      fontSize: 14,
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

  static Widget fixed<T>({
    required BuildContext context,
    required String title,
    required List<ColumnItem> columns,
    required List<RowItem> data,
    List<BoxShadow>? boxShadow,
    String? addText,
    void Function()? onTapAdd,
    double maxLargeScreenWidth = 1575,
    double maxMediumScreenWidth = 1000,
    double maxSmallScreenWidth = 800,
    double maxHeight = double.infinity,
    double columnHeight = 100.0,
    double? rowHeight,
    int? rowMaxLines,
    TextOverflow? rowTextOverflow,
    Color? columnBackgroundColor,
    SearchProps? searchProps,
    PaginationProps? paginationProps,
  }) {
    ScrollController horizontalScrollController = ScrollController();
    ScrollController verticalScrollController = ScrollController();

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
      padding: AppTheme.geometry.custom(top: 16, left: 16, right: 16, bottom: 0),
      constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: double.infinity),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppTheme.boxShadows.basic,
        borderRadius: AppTheme.radius.small,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.typography.titleLarge,
          ),
          AppTheme.spacing.customY(12),
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
                  child: ButtonWidget.ractangle(
                    height: 49,
                    text: addText,
                    type: ButtonType.primary,
                    onPressed: onTapAdd,
                  ),
                ),
            ],
          ),
          Scrollbar(
            interactive: true,
            thumbVisibility: true,
            controller: horizontalScrollController,
            scrollbarOrientation: ScrollbarOrientation.bottom,
            child: SingleChildScrollView(
              controller: horizontalScrollController,
              scrollDirection: Axis.horizontal,
              // padding: AppTheme.geometry.mediumB,
              child: SizedBox(
                width: getMaxWidthTable(),
                child: Column(
                  children: [
                    _headColumn(
                      columns: columns,
                      maxHeight: columnHeight,
                      color: columnBackgroundColor,
                    ),
                    SizedBox(
                      height: AppTheme.double.screenH(context) - (paginationProps != null ? 285 : 300),
                      child: Column(
                        children: [
                          Expanded(
                            child: Scrollbar(
                              interactive: true,
                              thumbVisibility: true,
                              controller: verticalScrollController,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                controller: verticalScrollController,
                                child: Column(
                                  children: List.generate(data.length, (index) {
                                    RowItem row = data[index];
                                    return SizedBox(
                                      height: rowHeight,
                                      child: TableRowHoverWidget(
                                        data: row,
                                        columns: columns,
                                        maxLines: rowMaxLines,
                                        overflow: rowTextOverflow,
                                        hoverColor: Colors.grey[100]!,
                                        isFirstIndex: index == 0,
                                        isLastIndex: (index == (data.length - 1)),
                                      ),
                                    );
                                  }),
                                ),
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
                                  child: PaginationCustomWidget(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
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
    double maxLargeScreenWidth = 1600,
    double maxMediumScreenWidth = 1000,
    double maxSmallScreenWidth = 800,
    double maxHeight = double.infinity,
    double columnHeight = 100.0,
    SearchProps? searchProps,
  }) {
    ScrollController scrollController = ScrollController();

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
                  child: ButtonWidget.ractangle(text: addText, type: ButtonType.primary, onPressed: onTapAdd),
                ),
            ],
          ),
          Scrollbar(
            interactive: true,
            thumbVisibility: true,
            controller: scrollController,
            scrollbarOrientation: ScrollbarOrientation.bottom,
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: getMaxWidthTable(),
                child: Column(
                  children: [
                    _headColumn(
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
