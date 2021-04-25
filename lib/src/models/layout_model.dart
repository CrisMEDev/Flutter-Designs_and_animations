import 'package:flutter/material.dart';
import 'package:backgrounds_custom_painter/src/pages/slideshows_page.dart';


class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideshowPage();

  Widget get currentPage => _currentPage;

  set currentPage(Widget currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}

