import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class AppStyles
{
  static TextStyle appBarTitleStyle=GoogleFonts.exo(fontWeight: FontWeight.w400,fontSize: 22.sp,color: ColorsManager.white);
  static TextStyle drawerTitleStyle=GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 24.sp,color: ColorsManager.white);
  static TextStyle categoriesTitleStyle=GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 24.sp,color: ColorsManager.black);
  static TextStyle settingsTitleStyle=GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 24.sp,color: ColorsManager.black);
  static TextStyle categoryTitle=GoogleFonts.exo(fontWeight: FontWeight.w400,fontSize: 22.sp,color: ColorsManager.white);

}