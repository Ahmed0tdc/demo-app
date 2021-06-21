import 'package:flutter/cupertino.dart';

class TabsSelectionProvider with ChangeNotifier {
  int _tabIndex = 0;
  bool _tabClicked = false;

  //getters
  int get getTabIndex => _tabIndex;
  bool get getTabClicked => _tabClicked;

  //setters
  set setTabIndex(int val) {
    _tabIndex = val;
    notifyListeners();
  }

  set setTabClicked(bool val) {
    _tabClicked = val;
    notifyListeners();
  }
}
