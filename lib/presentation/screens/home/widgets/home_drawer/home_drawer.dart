import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef OnDrawerItemClicked=void Function(MenuItem);
class HomeDrawer extends StatelessWidget {
   HomeDrawer({super.key,required this.onDrawerItemClicked});
  OnDrawerItemClicked onDrawerItemClicked;


  @override
  Widget build(BuildContext context) {
    return  Drawer(
      width: 285.w,
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).indicatorColor,
              width: double.infinity,
              height: 110.h,
              alignment: Alignment.center,
              child: Text(AppLocalizations.of(context)!.newsApp,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25),)),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    onDrawerItemClicked(MenuItem.categories);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.view_list,size: 35,),
                      SizedBox(width: 11.w,),
                      Text(AppLocalizations.of(context)!.categories,style: AppStyles.categoriesTitleStyle,),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                InkWell(
                  onTap: (){
                    onDrawerItemClicked(MenuItem.settings);

                  },
                  child: Row(
                    children: [
                      const Icon(Icons.settings,size: 35,),
                      SizedBox(width: 11.w,),
                      Text(AppLocalizations.of(context)!.settingsTitle,style: AppStyles.settingsTitleStyle,),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
enum MenuItem{
  categories,
  settings,

}


