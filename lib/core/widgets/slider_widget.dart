import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class SliderWidget {
  static Widget basic({
    required int currentIndex,
    required List<Widget> items,
    Color? indicatorActiveColor,
    Axis? scrillDirection,
    double height = 200,
    bool autoPlay = true,
    Duration autoPlayInterval = const Duration(seconds: 3),
    Curve autoPlayCurve = Curves.fastOutSlowIn,
    double viewportFraction = 1,
    dynamic Function(int, CarouselPageChangedReason)? onPageChanged,
  }) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height,
            initialPage: currentIndex,
            scrollDirection: scrillDirection ?? Axis.horizontal,
            autoPlay: autoPlay,
            enlargeCenterPage: true,
            autoPlayInterval: autoPlayInterval,
            autoPlayAnimationDuration: const Duration(milliseconds: 1200),
            autoPlayCurve: autoPlayCurve,
            viewportFraction: viewportFraction,
            onPageChanged: onPageChanged,
          ),
          items: items,
        ),
        AppTheme.spacing.exSmallY,
        _indicator(length: items.length, currentIndex: currentIndex, activeColor: indicatorActiveColor)
      ],
    );
  }

  static Widget _indicator({
    required int length,
    required int currentIndex,
    required Color? activeColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (index) {
          if (index == currentIndex) {
            return Container(
              width: 20,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                color: activeColor ?? AppTheme.colors.secondary,
                borderRadius: AppTheme.radius.small,
              ),
            );
          }
          return Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[400],
            ),
          );
        }),
      ),
    );
  }
}
