import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/styles_manager.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: Colors.white,
    canvasColor: Colors.white,
    indicatorColor: Colors.teal,
    dividerColor: Colors.blueGrey,
    useMaterial3: false,// لضمان أن اللون الافتراضي للأجزاء المتداخلة هو الأبيض
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal,
      titleTextStyle: AppStyles.appBarTitleStyle,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50.r),
        ),
      ),
    ),
    drawerTheme:  DrawerThemeData(
      backgroundColor: Colors.white, // تحديد لون الخلفية للـ Drawer
    ),
  );



  static final ThemeData dark = ThemeData(
    primaryColor: Colors.black,
    canvasColor: Colors.black,
    indicatorColor: Colors.blueAccent,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueAccent,
      titleTextStyle: AppStyles.appBarTitleStyle,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50.r),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white, // لون الأيقونات في الوضع الداكن
        size: 30,
      ),
    ),
    drawerTheme:  DrawerThemeData(
      backgroundColor: Colors.white, // تحديد لون الخلفية للـ Drawer
    ),
  );
}
