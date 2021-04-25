import 'package:backgrounds_custom_painter/labs/slideshow_page.dart';
import 'package:flutter/material.dart';


class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideshowPage();

  Widget get currentPage => _currentPage;

  set currentPage(Widget currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}

