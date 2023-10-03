import 'package:flutter/material.dart';

class NumberProvider with ChangeNotifier {
  int _number = 0;

  int get number => _number;

  set number(int value) {
    _number = value;
    notifyListeners();
  }
}