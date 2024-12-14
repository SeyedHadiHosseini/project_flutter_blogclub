// 1. Import the provider package in pubspec.yaml
// provider:

import 'package:flutter/material.dart';

// 3. Create a ChangeNotifier class for state management
class MyProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
  void decrement() {
    _counter--;
    notifyListeners();
  }
}