import 'package:flutter/widgets.dart';

class MainHomeProvider  with ChangeNotifier{
  int currentScreen=0;
changeScreen(int index){
currentScreen=index;
  notifyListeners();
}
}