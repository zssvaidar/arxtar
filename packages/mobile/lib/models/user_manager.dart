import 'package:flutter/material.dart';

class UserManager extends ChangeNotifier {
  bool get darkMode => _darkMode;
  var _darkMode = false;
}