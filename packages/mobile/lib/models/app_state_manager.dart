import 'dart:async';

import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  bool get isInitialized => _initialized;

  bool _initialized = false;

  void initializeApp() {

    Timer(
      const Duration(milliseconds: 2000),
          () {
        // 8
        _initialized = true;
        // 9
        notifyListeners();
      },
    );
  }
}