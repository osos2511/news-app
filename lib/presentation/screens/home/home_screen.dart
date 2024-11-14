import 'package:flutter/material.dart';
import 'package:news_app/core/utils/strings_manager.dart';
import 'package:news_app/data_model/category_Dm/category_Dm.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/categories_tab.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/category_details.dart';
import 'package:news_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:news_app/presentation/screens/home/widgets/home_drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
late Widget selectedWidget;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget=CategoriesTab(onCategoryItemClicked: onCategoryClick,);
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
      title: const Text(StringsManager.appBarTitle),
        ),
        drawer: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }
void onCategoryClick(CategoryDm category){
    selectedWidget=CategoryDetails(categoryDm: category,);
    setState(() {

    });
}
  void onDrawerItemClicked(MenuItem item){
    switch(item){
      case MenuItem.categories:{
       selectedWidget= CategoriesTab(onCategoryItemClicked: onCategoryClick,);
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
