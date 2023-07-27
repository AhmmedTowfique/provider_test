import 'dart:math';

import 'package:flutter/material.dart';

class ColouredCirclePageProvider with ChangeNotifier {
  Color _color = Colors.white;
  Color get color => _color;

  void setColor(Color newColor) {
    _color = newColor;
    notifyListeners();
  }

  void changeColorRandomly() {
    final random = Random();
    final newColor = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    setColor(newColor);
  }
}
