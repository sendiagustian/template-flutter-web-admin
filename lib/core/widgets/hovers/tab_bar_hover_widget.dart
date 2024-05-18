import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

class TabBarHoverWidget extends StatefulWidget {
  final String label;
  final bool isSelected;
  final MouseCursor cursor;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Clip clipBehavior;
  final BoxShape shape;

  const TabBarHoverWidget({
    super.key,
    required this.label,
    required this.isSelected,
    this.cursor = SystemMouseCursors.click,
    this.alignment,
    this.padding,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
    this.shape = BoxShape.rectangle,
  });

  @override
  State<TabBarHoverWidget> createState() => _TabBarHoverWidgetState();
}

class _TabBarHoverWidgetState extends State<TabBarHoverWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        alignment: widget.alignment,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.isSelected ? AppTheme.colors.primary : (_isHovered ? AppTheme.colors.secondary : Colors.white),
          image: widget.decoration?.image,
          border: widget.decoration?.border,
          borderRadius: widget.decoration?.borderRadius,
          boxShadow: widget.decoration?.boxShadow,
          gradient: widget.decoration?.gradient,
          backgroundBlendMode: widget.decoration?.backgroundBlendMode,
          shape: widget.shape,
        ),
        foregroundDecoration: widget.foregroundDecoration,
        width: widget.width,
        height: widget.height,
        constraints: widget.constraints,
        margin: widget.margin,
        transform: widget.transform,
        transformAlignment: widget.transformAlignment,
        clipBehavior: widget.clipBehavior,
        child: Text(
          widget.label,
          style: AppTheme.typography.titleSmall.copyWith(
            color: _isHovered ? Colors.white : (widget.isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
