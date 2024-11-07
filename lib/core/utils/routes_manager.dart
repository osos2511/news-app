import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home/home_screen.dart';
import 'package:news_app/presentation/screens/splash/splash_screen.dart';

class RoutesManager{
  static const String splashRoute='/splash';
  static const String homeRoute='/home';
  static Route<dynamic>? router(RouteSettings settings){
    switch(settings.name){
      case splashRoute:{
        return MaterialPageRoute(builder: (context) => const SplashScreen(),);

      }
      case homeRoute:{
        return MaterialPageRoute(builder: (context) =>  HomeScreen(),);

      }
    }
  }
}