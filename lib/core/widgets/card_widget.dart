import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class CardWidget {
  static final List<BoxShadow> _cardShadows = [
    const BoxShadow(
      color: Color(0x111C1B76),
      blurRadius: 26.96,
      offset: Offset(0, 3.68),
      spreadRadius: 0,
    ),
  ];

  static Widget _separator({required bool isExpansion, bool isDashed = false}) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double boxWidth = constraints.constrainWidth();
        double dashWidth = 8.0;
        double dashHeight = isExpansion ? 1.2 : 0.8;
        int dashCount = (boxWidth / (2 * dashWidth)).floor();
        if (!isDashed) {
          return Container(height: isExpansion ? 1 : 1.2, width: double.infinity, color: Colors.grey[300]);
        }
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  static Widget basic({
    required String title,
    required List<Widget> children,
    ImageProvider<Object>? placeholder,
    ImageProvider<Object>? image,
    double? heightImage = 200,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    bool noImage = placeholder == null && image == null;
    assert(placeholder != null && image != null || placeholder == null && image == null);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppTheme.radius.exSmall,
        boxShadow: _cardShadows,
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (placeholder != null && image != null)
            Padding(
              padding: AppTheme.geometry.custom(top: 16, left: 16, right: 16, bottom: 0),
              child: FadeInImage(
                placeholder: placeholder,
                image: image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: heightImage,
              ),
            ),
          Padding(
            padding: noImage ? AppTheme.geometry.medium : AppTheme.geometry.custom(left: 16, top: 16, right: 16, bottom: 12),
            child: Text(title, style: AppTheme.typography.titleMedium),
          ),
          if (noImage) _separator(isExpansion: false),
          Container(
            padding: noImage ? AppTheme.geometry.medium : AppTheme.geometry.custom(left: 16, top: 0, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  static Widget expansion({
    required String title,
    required List<Widget> children,
    bool initiallyExpanded = false,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: _cardShadows,
        borderRadius: AppTheme.radius.exSmall,
      ),
      child: ExpansionTile(
        enableFeedback: false,
        initiallyExpanded: initiallyExpanded,
        expandedAlignment: Alignment.centerLeft,
        expandedCrossAxisAlignment: crossAxisAlignment,
        tilePadding: AppTheme.geometry.custom(left: 16, right: 16, top: 8, bottom: 8),
        title: Text(title, style: AppTheme.typography.titleMedium),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: AppTheme.radius.exSmall,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppTheme.radius.exSmall,
        ),
        children: [
          _separator(isExpansion: true),
          Container(
            padding: AppTheme.geometry.medium,
            child: Column(children: children),
          ),
        ],
      ),
    );
  }
}
