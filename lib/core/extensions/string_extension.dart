import 'package:intl/intl.dart';

extension StringExtension on String {
  // test = Test
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toCamelCaseUp() {
    // TestCamelcase
    String input = this;
    List<String> words = input.split(RegExp(r'\s+|_+'));

    // Capitalize the first letter of each word (except the first word)
    for (int i = 1; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }

    // Concatenate the words to form camel case
    String camelCaseString = words.join('');

    return camelCaseString;
  }

  String toCamelCaseLow() {
    // testLowCase
    String input = this;
    List<String> words = input.split(" ");

    String camelCaseString = '';
    for (int i = 0; i < words.length; i++) {
      if (i == 0) {
        words[0] = words[i].toLowerCase();
      }

      camelCaseString += words[i];
    }
    return camelCaseString;
  }

  String toWordCase() {
    String input = this;
    List<String> words = input.split(RegExp(r'(?=[A-Z])'));

    List<String> newWords = words.map((e) {
      String word;
      if (e.split('-').length > 1) {
        word = e.split('-').map((e) => e.capitalize()).join(" ");
      } else {
        word = e.capitalize();
      }

      return word;
    }).toList();

    String camelCaseString = newWords.join(" ");

    return camelCaseString;
  }

  String toSnakeCase() {
    String input = this;
    List<String> words = input.split(" ");

    String snakeCaseString = words.join("-").toLowerCase();

    return snakeCaseString;
  }

  String removeSlug() {
    // test-remove-slug = testremoveslug
    String data = this;
    List<String> datas = data.split('-');
    List<String> result = [];
    for (String item in datas) {
      result.add(item.capitalize());
    }
    return result.join(' ');
  }

  String sarFormatter() {
    String data = this;
    double dataDouble = double.parse(data);
    final currencyFormatter = NumberFormat.currency(
      locale: 'ar_AR',
      decimalDigits: 2,
      name: 'SAR ',
    );
    return currencyFormatter.format(dataDouble);
  }

  String idrFormatter() {
    String data = this;
    double dataDouble = double.parse(data);
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      decimalDigits: 2,
      name: 'Rp. ',
    );
    return currencyFormatter.format(dataDouble);
  }

  String usdFormatter() {
    String data = this;
    double dataDouble = double.parse(data);
    final currencyFormatter = NumberFormat.currency(
      locale: 'en_US',
      decimalDigits: 2,
      symbol: '\$',
    );
    return currencyFormatter.format(dataDouble);
  }

  String percentageFormatter() {
    String data = this;
    double dataDouble = double.parse(data);
    double percentageValue = dataDouble / 100;
    final percentageFormatter = NumberFormat.percentPattern();
    return percentageFormatter.format(percentageValue);
  }

  String fullDateTime() {
    dynamic date = this;
    String fullDate = "-";

    if (date is String) {
      DateTime parsedDate = DateTime.parse(date);
      String dateFormated = DateFormat("dd MMMM yyyy HH:mm").format(
        parsedDate,
      );
      fullDate = dateFormated;
    } else if (date is DateTime) {
      String dateFormated = DateFormat("dd MMMM yyyy HH:mm").format(
        date,
      );
      fullDate = dateFormated;
    }

    return fullDate;
  }

  String fullDate() {
    dynamic date = this;
    String fullDate = "-";

    if (date is String) {
      DateTime parsedDate = DateTime.parse(date);
      String dateFormated = DateFormat("dd MMMM yyyy", "id").format(parsedDate);
      fullDate = dateFormated;
    } else if (date is DateTime) {
      String dateFormated = DateFormat("dd MMMM yyyy", "id").format(date);
      fullDate = dateFormated;
    }

    return fullDate;
  }

  String toTime() {
    dynamic date = this;
    String fullDate = "-";

    if (date is String) {
      try {
        DateTime parsedDate = DateTime.parse(date);
        String dateFormated = DateFormat("HH:mm", "id").format(
          parsedDate,
        );
        fullDate = dateFormated;
      } catch (e) {
        return "-";
      }
    } else if (date is DateTime) {
      try {
        String dateFormated = DateFormat("HH:mm", "id").format(
          date,
        );
        fullDate = dateFormated;
      } catch (e) {
        return "-";
      }
    }

    return fullDate;
  }

  String toNow() {
    dynamic date = this;
    String fullDate = "-";

    if (date is String) {
      DateTime parsedDate = DateTime.parse(date);
      final now = DateTime.now();
      final difference = now.difference(parsedDate).inDays;

      if (difference <= 7) {
        if (difference == 0) {
          fullDate = "Hari ini";
        } else if (difference == 1) {
          fullDate = "Kemarin";
        } else {
          fullDate = DateFormat("EEEE", "id").format(parsedDate);
        }
      } else {
        fullDate = DateFormat("MM/dd/yyyy", "id").format(parsedDate);
      }
    } else if (date is DateTime) {
      final now = DateTime.now();
      final difference = now.difference(date).inDays;

      if (difference <= 7) {
        if (difference == 0) {
          fullDate = "Hari ini";
        } else if (difference == 1) {
          fullDate = "Kemarin";
        } else {
          fullDate = DateFormat("EEEE", "id").format(date);
        }
      } else {
        fullDate = DateFormat("MM/dd/yyyy", "id").format(date);
      }
    }

    return fullDate;
  }
}
