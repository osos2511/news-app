import 'package:flutter/material.dart';
import 'core/utils/di/di.dart';
import 'my_app/my_app.dart';

void main() {
  configureDependencies();
  runApp( const MyApp());
}