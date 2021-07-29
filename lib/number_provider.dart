import 'package:flutter/cupertino.dart';

class NumberProvider with ChangeNotifier {
  int _number = 0;

  int get number => _number;
  set number(int value) {
    _number = value;
    // fungsi di bawah berguna untuk memberitahu pada widget" yang menunggu (Consumer)
    // jadi di kasih tau "ada perubahan nih!"
    notifyListeners();
  }
}
