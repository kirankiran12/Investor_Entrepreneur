import 'package:flutter/material.dart';

class ExpansionTileState with ChangeNotifier {
  Map<String, String> selectedItems = {};

  void updateSelectedItem(String title, String item) {
    selectedItems[title] = item;
    notifyListeners();
  }

  String? getSelectedItem(String title) {
    return selectedItems[title];
  }
}
