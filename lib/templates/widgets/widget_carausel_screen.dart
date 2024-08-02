import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/themes/app_theme.dart';
import '../../core/utils/app_util.dart';
import '../../core/widgets/card_widget.dart';
import '../../core/widgets/slider_widget.dart';

class WidgetCarauselScreen extends StatelessWidget {
  const WidgetCarauselScreen({super.key});

  static const String path = '/widgets/widget-carausel';
  static const String name = 'Carausel Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.slideshow_rounded;

  static const List<String> bannerData = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WidgetCarauselState(),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: AppTheme.geometry.medium,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Carausel Widgets",
                style: AppTheme.typography.displayMedium,
              ),
              AppTheme.spacing.customY(24),
              Consumer<WidgetCarauselState>(builder: (_, state, __) {
                return CardWidget.basic(
                  title: "Carausel Basic",
                  children: [
                    SliderWidget.basic(
                      height: isLargeScreen(context)
                          ? 400
                          : isMediumScreen(context)
                              ? 240
                              : 160,
                      currentIndex: state.currentIndex,
                      onPageChanged: (index, _) {
                        state.currentIndex = index;
                      },
                      items: bannerData.map((banner) {
                        return InkWell(
                          onTap: () async {},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: FadeInImage(
                                fit: BoxFit.cover,
                                placeholder: const AssetImage(
                                  'assets/images/placeholder.png',
                                ),
                                image: AssetImage(banner),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetCarauselState with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
