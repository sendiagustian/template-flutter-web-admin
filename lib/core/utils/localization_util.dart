import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class LocalizationUtil {
  static const LocalizationsDelegate<LocalizationUtil> delegate =
      _LocalizationUtilDelegate();

  static LocalizationUtil? of(BuildContext context) {
    return Localizations.of<LocalizationUtil>(context, LocalizationUtil);
  }

  String getHelloMessage() {
    return Intl.message(
      'Hello, World!',
      name: 'getHelloMessage',
      desc: 'Hello message',
    );
  }
}

class _LocalizationUtilDelegate
    extends LocalizationsDelegate<LocalizationUtil> {
  const _LocalizationUtilDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['id', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<LocalizationUtil> load(Locale locale) async {
    await initializeDateFormatting(locale.toString(), null);
    return LocalizationUtil();
  }

  @override
  bool shouldReload(_LocalizationUtilDelegate old) => false;
}
