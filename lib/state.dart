import 'package:flutter/foundation.dart';

class GlobalState extends ChangeNotifier {
  bool showSearchbar = false;
  int selectedOrderMethod = 0;

  //toggle search bar  on homepage
  toggleSearchbar() {
    showSearchbar = !showSearchbar;
    notifyListeners();
  }

  //select order method on homepage e.g. delivery or pickup etc
  int setSelectedOrderMethod(int index) {
    selectedOrderMethod = index;
    notifyListeners();
  }
}
