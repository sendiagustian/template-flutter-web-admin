import 'package:flutter/material.dart';

import '../extensions/string_extension.dart';
import '../themes/app_theme.dart';

class BreadcrumbsWidget {
  static List<String> _getSegments() {
    String currentPath = Uri.base.path;

    List<String> segments = ['dashboard'];
    segments.addAll((currentPath.split('/').where((segment) {
      return segment.isNotEmpty;
    }).toList()));

    return segments;
  }

  static Widget basic(BuildContext context, String? title) {
    List<String> segments = _getSegments();
    return Builder(builder: (context) {
      if (title != null) {
        return Text(
          title,
          style: AppTheme.typography.titleMedium,
        );
      } else {
        if (segments.length == 1) {
          return Text(segments.first.snakeCasetoWordCase());
        } else {
          return Wrap(
            spacing: 8.0,
            children: List.generate(segments.length, (index) {
              String item = segments[index];
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Builder(builder: (context) {
                    if (segments.first.snakeCasetoWordCase() != item) {
                      return const Icon(
                        Icons.keyboard_double_arrow_right_rounded,
                      );
                    }
                    return const SizedBox();
                  }),
                  Text(item.snakeCasetoWordCase()),
                ],
              );
            }),
          );
        }
      }
    });
  }
}
