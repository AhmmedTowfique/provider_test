import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  bool? isEligible = false;
  String? eligibiltyMessage = '';

  bool isButtonPress = false;

  void checkEligibility(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibiltyMessage = 'You are eligible';
      notifyListeners();
    } else {
      isEligible = false;
      eligibiltyMessage = 'You are not eligible';
      notifyListeners();
    }

  }
  void checkButtonPress(bool test){
    notifyListeners();
  }
}
