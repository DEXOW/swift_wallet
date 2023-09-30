import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  int _selectedScreenIndex = 1;

  int get selectedIndex => _selectedScreenIndex;

  void setIndex(int index) {
    _selectedScreenIndex = index;
    notifyListeners();
  }
}