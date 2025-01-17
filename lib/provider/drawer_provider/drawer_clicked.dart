// DrawerClicked class
import 'package:flutter/material.dart';
import 'package:news_app/data_model/category_Dm/category_Dm.dart';

class DrawerClicked extends ChangeNotifier {
  String currentScreen = 'Categories';
  CategoryDm? selectedCategory;

  void updateScreen(String newScreen, {CategoryDm? category}) {
    currentScreen = newScreen;
    selectedCategory = category;
    notifyListeners();
  }
}
