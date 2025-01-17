import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/routes_manager.dart';
import 'package:news_app/data_model/category_Dm/category_Dm.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/categories_tab.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/category_details.dart';
import 'package:news_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:news_app/presentation/screens/home/widgets/home_drawer/home_drawer.dart';
import '../../../core/utils/colors_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
late Widget selectedWidget;
String appBarTitle='News-App';
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget=CategoriesTab(onCategoryItemClicked: onCategoryClick,);
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(image: AssetImage(AssetsManager.bgMyApp))
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white54,
        title:  Text(appBarTitle),
            actions: [
              IconButton(onPressed: (){
                Navigator.pushNamed(context, RoutesManager.searchRoute);
              }, icon: const Icon(Icons.search,size: 30)),
            ],
          ),
          drawer: HomeDrawer(
            onDrawerItemClicked: onDrawerItemClicked,
          ),
          body: selectedWidget,
        ),
      ),
    );
  }
void onCategoryClick(CategoryDm category){
    selectedWidget=CategoryDetails(categoryDm: category);
    appBarTitle=category.title;
    setState(() {

    });
}
  void onDrawerItemClicked(MenuItem item){
    switch(item){
      case MenuItem.categories:{
       selectedWidget= CategoriesTab(onCategoryItemClicked: onCategoryClick,);
       appBarTitle=AppLocalizations.of(context)!.categories;

      }
      case MenuItem.settings:{
        selectedWidget= SettingsTab();
        appBarTitle='Settings';
      }
    }
    Navigator.pop(context);
    setState(() {

    });
  }
}
