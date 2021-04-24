import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  bool _darkTheme          = false;
  bool _customTheme        = false;
  ThemeData _currentTheme;

  ThemeChanger( int theme ){
    switch(theme){
      case 1: // light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
      break;

      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
      break;

      case 3:
        _darkTheme = false;
        _customTheme = true;
      break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool get darkTheme         => this._darkTheme;
  bool get customTheme       => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool darkTheme) {
    this._darkTheme = darkTheme;
    this._customTheme = false;

    if ( darkTheme ){
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool customTheme) {
    this._customTheme = customTheme;
    this._darkTheme = false;

    if ( customTheme ){
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
  
}

