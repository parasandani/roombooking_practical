import 'package:flutter/material.dart';

class RoomItemViewModel with ChangeNotifier {
  BuildContext? context;

  void attachContext(BuildContext context) {
    this.context = context;
  }
}