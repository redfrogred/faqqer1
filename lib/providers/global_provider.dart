import 'package:flutter/material.dart';

import '../classes/Config.dart';

class Global with ChangeNotifier {

    // POPS
    void incrementPop() {
      Config.pops++;
      notifyListeners();
    }

    String getPops() {
      return Config.pops.toString();
    }

    // CLICKS
    void incrementClick() {
      Config.clicks++;
      notifyListeners();
    }

    String getClicks() {
      return Config.clicks.toString();
    }

    // FRUITS
    void setFruit( String str ) {
      Config.fruit = str;
      notifyListeners();
    }

    String getFruit() {
      return Config.fruit.toString();
    }



}