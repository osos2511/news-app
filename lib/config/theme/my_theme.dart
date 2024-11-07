import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles_manager.dart';

class AppTheme{
  static final ThemeData light=ThemeData(
    appBarTheme:  AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsManager.white,
      ),

      backgroundColor: Colors.green,
      titleTextStyle: AppStyles.appBarTitleStyle,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.r)),
      )
    ),
  );
}