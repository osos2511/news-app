import 'package:flutter/material.dart';
import 'package:news_app/core/utils/strings_manager.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/categories_tab.dart';
import 'package:news_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:news_app/presentation/screens/home/widgets/home_drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
Widget selectedWidget=const CategoriesTab();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
      title:  Text(StringsManager.appBarTitle),
        ),
        drawer: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  void onDrawerItemClicked(MenuItem item){
    switch(item){
      case MenuItem.categories:{
       selectedWidget=const CategoriesTab();
      }
      case MenuItem.settings:{
        selectedWidget=const SettingsTab();
      }
    }
    Navigator.pop(context);
    setState(() {

    });
  }
}
