import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../themes/app_theme.dart';

class ProgressbarCustomWidget extends StatelessWidget {
  final double width;
  final int progress;
  final int total;
  final bool showPrentage;

  const ProgressbarCustomWidget({
    super.key,
    required this.width,
    required this.progress,
    required this.total,
    this.showPrentage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 8,
                  width: width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 220, 220, 220),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 8,
                  width: width * (progress / total),
                  decoration: BoxDecoration(
                    color: AppTheme.colors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          AppTheme.spacing.smallX,
          Text(
            '${((progress / total) * 100).round()}%',
            style: AppTheme.typography.labelLarge,
          ),
        ],
      );
    });
  }
}
