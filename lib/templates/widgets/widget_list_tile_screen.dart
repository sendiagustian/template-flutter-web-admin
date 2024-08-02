import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';
import '../../core/widgets/list_tile_widget.dart';

class WidgetListTileScreen extends StatelessWidget {
  const WidgetListTileScreen({super.key});

  static const String path = '/widgets/widget-list-tile';
  static const String name = 'List Tile Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.list_rounded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppTheme.geometry.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "List Tile Widgets",
              style: AppTheme.typography.displayMedium,
            ),
            AppTheme.spacing.customY(24),
            ...List.generate(5, (index) {
              int contentText = index + 1;
              return Container(
                margin: AppTheme.geometry.mediumB,
                child: ListTileWidget.basic(
                  context: context,
                  withColorLeading: true,
                  onTapDetail: () {},
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                  leading: const Icon(
                    Icons.person,
                    size: 32,
                    color: Colors.white,
                  ),
                  title: "Title",
                  content: List.generate(contentText, (index) {
                    return Text(
                      "data ${index + 1}",
                      style: AppTheme.typography.bodyMedium,
                    );
                  }),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
