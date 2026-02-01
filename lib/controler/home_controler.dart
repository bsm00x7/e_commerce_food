import 'package:flutter/material.dart';

class HomeControler extends ChangeNotifier {
  int indexSelect = 0;

  void updateIndexSelect({required int index}) {
    if (index != indexSelect) {
      indexSelect = index;
      notifyListeners();
    }
  }
}
