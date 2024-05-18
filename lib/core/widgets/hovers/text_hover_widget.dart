import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

class TextHoverWidget extends StatefulWidget {
  final String text;
  final IconData? icon;
  final Color defaultColor;
  final Color hoverColor;
  final void Function()? onTap;

  const TextHoverWidget({
    super.key,
    required this.text,
    required this.defaultColor,
    required this.hoverColor,
    this.icon,
    this.onTap,
  });

  @override
  State<TextHoverWidget> createState() => TextHoverWidgetState();
}

class TextHoverWidgetState extends State<TextHoverWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: _isHovered ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            Builder(builder: (context) {
              if (widget.icon != null) {
                return Icon(widget.icon, color: _isHovered ? widget.hoverColor : widget.defaultColor);
              } else {
                return const SizedBox();
              }
            }),
            if (widget.icon != null) AppTheme.spacing.mediumX,
            Text(
              widget.text,
              style: TextStyle(
                color: _isHovered ? widget.hoverColor : widget.defaultColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
