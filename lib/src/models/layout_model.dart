import 'package:flutter/material.dart';
import 'package:app_backgrounds_customs/src/pages/slidershow_page.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideshowPage();
  Widget get currentPage => this._currentPage;
  set currentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  }
}
