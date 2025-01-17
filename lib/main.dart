import 'package:flutter/material.dart';
import 'package:news_app/settings_provider/language_provider.dart';
import 'package:news_app/settings_provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'core/utils/di/di.dart';
import 'my_app/my_app.dart';

void main() {
  configureDependencies();
  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()..getTheme(),),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider()..getLang(),),
      ],
      child:
  const MyApp()));
}