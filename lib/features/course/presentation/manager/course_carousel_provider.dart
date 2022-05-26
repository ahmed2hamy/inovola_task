import 'package:flutter/material.dart';

class CourseCarouselProvider extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void setCurrentPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
