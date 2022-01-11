import 'package:flutter/material.dart';
import 'package:flutter_test_provider/user.dart';
import 'package:logger/logger.dart';

class HomeController extends ChangeNotifier {
  int a = 0;
  int b = 0;
  User user = User(1, 'amine', 'address');

  HomeController() {
    Logger().v('HomeController init');
  }

  onIncrementA() {
    a++;
    notifyListeners();
  }

  onIncrementB() {
    b++;
    user.name = 'asma';
    notifyListeners();
  }
}
