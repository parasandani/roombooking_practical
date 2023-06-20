import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CommonUtils {
  static String? getFormattedDate(DateTime? dateTime) {
    if (dateTime == null) return null;
    try {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    } catch (e) {
      // TODO
    }
    return null;
  }

  static int calculateAge(String? dob) {
    if (dob == null || dob.isEmpty) return 0;
    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateTime.parse(dob);
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
