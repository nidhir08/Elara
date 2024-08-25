import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formatting {
  String toSentenceCase(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  double toInr(double dollar) {
    return double.parse((dollar * 83.94).toStringAsFixed(2));
  }

  String Avability(int stock) {
    if (stock < 0)
      return "Out of Stock";
    else if (stock > 3)
      return "In Stock";
    else
      return "Closing Stock";
  }

  TextStyle textStyle(String type) {
    if (type == "main") {
      return TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(108, 76, 54, 1),
      );
    } else {
      return TextStyle(
        fontSize: 16,
        color: Colors.black,
      );
    }
  }

  String convertTime(String isoTime) {
    DateTime dateTime = DateTime.parse(isoTime);
    DateFormat outputFormat = DateFormat('MMM dd, yyyy');
    String formattedTime = outputFormat.format(dateTime);
    return formattedTime;
  }
}
