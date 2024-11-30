import 'package:flutter/material.dart';
import 'package:news_app/data_model/category_Dm/category_Dm.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/view/sources_view.dart';

class CategoryDetails extends StatelessWidget {
   CategoryDetails({super.key,required this.categoryDm});
CategoryDm categoryDm;

  @override
  Widget build(BuildContext context) {
     return SourcesView(categoryDm: categoryDm);
  }
}
