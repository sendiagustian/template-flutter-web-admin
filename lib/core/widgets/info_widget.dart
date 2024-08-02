import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class InfoWidget {
  static Widget basic({
    required BuildContext context,
    String? title,
    required String text,
    EdgeInsets? contentPadding,
    bool? switched,
    bool? value,
    Function(bool)? onChanged,
  }) {
    return Container(
      padding: contentPadding,
      width: AppTheme.double.screenW(context),
      child: Stack(
        children: [
          Positioned(
            top: -6,
            left: -6,
            child: Icon(
              Icons.info,
              size: 30,
              color: AppTheme.colors.primary.withOpacity(0.5),
            ),
          ),
          Builder(builder: (context) {
            if (switched == true) {
              return SwitchListTile(
                title: Text(
                  title!,
                  style: AppTheme.typography.titleMedium,
                ),
                subtitle: Text(
                  text,
                  style: AppTheme.typography.bodySmall,
                ),
                value: value!,
                onChanged: onChanged,
              );
            } else {
              return Container(
                padding: const EdgeInsets.all(16.0),
                width: AppTheme.double.screenW(context),
                decoration: BoxDecoration(
                  color: AppTheme.colors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  text,
                  style: AppTheme.typography.titleMedium,
                ),
              );
            }
          }),
        ],
      ),
    );
  }

  // Custom Widget untuk box info
  static Widget box({
    String title = '',
    String subtitle = '',
  }) {
    return Container(
      margin: AppTheme.geometry.custom(left: 20, right: 20, top: 10, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.colors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -6,
            left: -6,
            child: Icon(
              Icons.info,
              size: 35,
              color: AppTheme.colors.primary.withOpacity(0.5),
            ),
          ),
          Container(
            padding: AppTheme.geometry.medium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTheme.typography.titleMedium,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan tidak ada data
  static Widget noData({
    // Size ilustrasi akan menyesuaikan dengan [height] 180.h dan [width] 180.w
    // Ukuran file ilustrasi 500x500
    Widget? illust,
    String? title,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    required String subtitle,
    Widget? button,
  }) {
    return Padding(
      padding: AppTheme.geometry.mediumX,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Builder(
              builder: (context) {
                if (illust != null) {
                  return Container(
                    margin: const EdgeInsets.only(
                      bottom: 24,
                    ),
                    child: illust,
                  );
                }
                return Container();
              },
            ),
            Builder(
              builder: (context) {
                if (title != null) {
                  return Text(
                    title,
                    style: titleStyle ?? AppTheme.typography.titleSmall,
                  );
                }
                return Container();
              },
            ),
            AppTheme.spacing.mediumY,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: subtitleStyle ?? AppTheme.typography.bodySmall,
            ),
            AppTheme.spacing.mediumX,
            button ?? Container(),
          ],
        ),
      ),
    );
  }

  static Widget loadingData({
    String? message,
    Color? color,
  }) {
    if (message != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          color: color ?? AppTheme.colors.primary,
        ),
      );
    }
  }

  // Untuk manampilkan snackbar
  static showSnackBar({
    required BuildContext context,
    required Widget content,
    required int duration,
  }) {
    ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);

    MaterialBanner banner = MaterialBanner(
      content: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: AppTheme.colors.primary,
          ),
          AppTheme.spacing.smallX,
          content,
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ],
    );

    scaffold
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(banner);

    Future.delayed(Duration(seconds: duration), () {
      scaffold.hideCurrentMaterialBanner();
    });
  }
}
