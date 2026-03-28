import 'package:flutter/material.dart';

class LetterChangeViewModel extends ChangeNotifier {
  Color _selectedColor = Colors.black;
  double _fontSize = 16.0;
  String _fontFamily = 'Roboto';

  Color get selectedColor => _selectedColor;
  double get fontSize => _fontSize;
  String get fontFamily => _fontFamily;

  void setColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  void setFontSize(double size) {
    _fontSize = size;
    notifyListeners();
  }

  void setFontFamily(String family) {
    _fontFamily = family;
    notifyListeners();
  }
}
