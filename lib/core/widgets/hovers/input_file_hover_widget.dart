import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';
import '../../utils/pick_file_util.dart';

class InputFileHoverWidget extends StatefulWidget {
  final PlatformFile? file;
  final MouseCursor cursor;
  final void Function()? onTap;

  const InputFileHoverWidget({
    super.key,
    required this.file,
    this.onTap,
    this.cursor = SystemMouseCursors.click,
  });

  @override
  State<InputFileHoverWidget> createState() => _InputFileHoverWidgetState();
}

class _InputFileHoverWidgetState extends State<InputFileHoverWidget> {
  bool _isHovered = false;
  static final PickFileUtil _fileUtil = PickFileUtil();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppTheme.radius.exSmall,
            border: Border.all(color: Colors.grey[400]!, width: 0.8),
          ),
          child: Row(
            children: [
              Container(
                padding: AppTheme.geometry.smallX,
                decoration: BoxDecoration(
                  color: _isHovered ? AppTheme.colors.primary.withOpacity(.6) : AppTheme.colors.secondary.withOpacity(.4),
                  border: Border(
                    left: BorderSide(color: Colors.grey[400]!, width: 0.2),
                    top: BorderSide(color: Colors.grey[400]!, width: 0.2),
                    bottom: BorderSide(color: Colors.grey[400]!, width: 0.2),
                  ),
                  borderRadius: AppTheme.radius.custom(topLeft: 4, bottomLeft: 4),
                ),
                child: Center(
                  child: Text(
                    'Choose File',
                    style: AppTheme.typography.labelLarge,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: AppTheme.geometry.smallX,
                  child: Text(
                    widget.file?.name != null ? _fileUtil.getFileName(widget.file!) : 'No file chosen',
                    style: AppTheme.typography.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
