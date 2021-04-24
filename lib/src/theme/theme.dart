import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  bool _darkTheme = false;
  bool _customTheme = false;


  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;

  set darkTheme(bool darkTheme) {
    this._darkTheme = darkTheme;
    this._customTheme = false;
    notifyListeners();
  }

  set customTheme(bool customTheme) {
    this._customTheme = customTheme;
    this._darkTheme = false;
    notifyListeners();
  }
  
}

