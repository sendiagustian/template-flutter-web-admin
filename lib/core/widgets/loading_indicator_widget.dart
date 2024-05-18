import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final String? loadingText;
  final double loadingSize;
  const LoadingIndicatorWidget({
    super.key,
    this.loadingText,
    required this.loadingSize,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(
        child: Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(secondary: AppTheme.colors.primary),
            ),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
