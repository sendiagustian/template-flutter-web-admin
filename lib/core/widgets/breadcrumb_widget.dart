import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../extensions/string_extension.dart';

class BreadcrumbsWidget extends StatelessWidget {
  final GoRouterState state;

  const BreadcrumbsWidget({
    super.key,
    required this.state,
  });
  List<String> getSegments() {
    String currentPath = state.fullPath!;

    List<String> segments = ['dashboard'];
    segments.addAll((currentPath.split('/').where((segment) {
      return segment.isNotEmpty;
    }).toList()));

    return segments;
  }

  @override
  Widget build(BuildContext context) {
    List<String> segments = getSegments();

    return Builder(builder: (context) {
      if (segments.length == 1) {
        return Text(segments.first.toWordCase());
      } else {
        return Wrap(
          spacing: 8.0,
          children: List.generate(segments.length, (index) {
            String item = segments[index];

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Builder(builder: (context) {
                  if (segments.first.toWordCase() != item) {
                    return const Icon(
                      Icons.keyboard_double_arrow_right_rounded,
                    );
                  }
                  return const SizedBox();
                }),
                Text(item.toWordCase()),
              ],
            );
          }),
        );
      }
    });
  }
}
