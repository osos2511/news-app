import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 2),(){
     Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
    }
    );
  }
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: Colors.white,
            child: Image.asset(AssetsManager.bgMyApp,fit: BoxFit.cover,)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Image.asset(AssetsManager.newsLogo,width: 199.w,height: 208.h,),
            const Spacer(),
            Image.asset(AssetsManager.routeLogo,width: 213.w,height: 128.h,),
          ],
        ),
      ],
    );
  }
}
