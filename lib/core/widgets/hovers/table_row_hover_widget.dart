import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';
import '../table_widget.dart';

class TableRowHoverWidget extends StatefulWidget {
  final Color? defaultColor;
  final Color hoverColor;
  final List<ColumnItem> columns;
  final RowItem data;
  final bool isFirstIndex;
  final bool isLastIndex;
  final double maxHeight;
  final double maxWidth;

  const TableRowHoverWidget({
    super.key,
    this.defaultColor,
    required this.hoverColor,
    required this.columns,
    required this.data,
    required this.isFirstIndex,
    required this.isLastIndex,
    this.maxHeight = 80.0,
    this.maxWidth = double.infinity,
  });

  @override
  State<TableRowHoverWidget> createState() => TableRowHoverWidgetState();
}

class TableRowHoverWidgetState extends State<TableRowHoverWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: (_isHovered && widget.data.onTap != null) ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.data.onTap,
        child: Container(
          margin: widget.isFirstIndex ? AppTheme.geometry.custom(top: 8) : null,
          padding: AppTheme.geometry.custom(top: 8, bottom: 8, left: 16, right: 16),
          constraints: BoxConstraints(maxHeight: widget.maxHeight, maxWidth: widget.maxWidth),
          decoration: BoxDecoration(
            color: _isHovered ? widget.hoverColor : (widget.defaultColor ?? Colors.white),
            borderRadius: AppTheme.radius.custom(
              bottomLeft: widget.isLastIndex ? 4.0 : 0.0,
              bottomRight: widget.isLastIndex ? 4.0 : 0.0,
            ),
            border: Border(
              bottom: widget.isLastIndex ? BorderSide.none : BorderSide(color: Colors.grey[200]!, width: 1.0),
            ),
          ),
          child: Row(
            children: [
              ...List.generate(
                widget.columns.length,
                (index) {
                  ColumnItem column = widget.columns[index];
                  dynamic value = widget.data.rowData[column.title];
                  if (column.isVisible) {
                    if (value is Widget) {
                      return Expanded(child: value);
                    } else {
                      return Expanded(
                        child: Container(
                          padding: AppTheme.geometry.small,
                          child: Text(
                            widget.data.rowData[column.title].toString(),
                            textAlign: column.textAlign,
                            style: AppTheme.typography.bodySmall,
                          ),
                        ),
                      );
                    }
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
        ),
      ),
    );
  }
}
