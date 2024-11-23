import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/article_details/article_details.dart';
import 'package:news_app/presentation/screens/home/home_screen.dart';
import 'package:news_app/presentation/screens/splash/splash_screen.dart';

import '../../data/model/articles_response/Article.dart';

class RoutesManager{
  static const String splashRoute='/splash';
  static const String homeRoute='/home';
  static const String articleDetailsRoute='/articleDetails';
  static Route<dynamic>? router(RouteSettings settings){
    switch(settings.name){
      case splashRoute:{
        return MaterialPageRoute(builder: (context) => const SplashScreen(),);

      }
      case homeRoute:{
        return MaterialPageRoute(builder: (context) =>  HomeScreen(),);

      }
      case articleDetailsRoute:{

        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>  ArticleDetails(),);

      }
    }
    return null;
  }
}