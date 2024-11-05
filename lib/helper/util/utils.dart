import 'dart:developer';


import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';


class Utils {
  static void console(String message) {
    if (kDebugMode) {
      log(message);
    }
  }
  static String formatReleaseDate(String date) {
    try {
      DateTime parsedDate = DateTime.parse(date);
      String formattedDate = DateFormat('MMMM dd, yyyy').format(parsedDate);
      return formattedDate;
    } catch (e) {
      return date;
    }
  }

}
