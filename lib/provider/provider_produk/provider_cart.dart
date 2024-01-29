import 'package:flutter/material.dart';

class ProviderCart extends ChangeNotifier {
  ProviderCart();

  int counter = 1;

  void additem() {
    counter++;
    notifyListeners();
  }

  void minusItem() {
    if(counter <= 1){
      notifyListeners();
    }else{
      counter--;
      notifyListeners();
    }
  }
}
