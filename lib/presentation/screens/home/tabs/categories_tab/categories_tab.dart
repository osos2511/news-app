import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data_model/category_Dm/category_Dm.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/widgets/category_widget.dart';
typedef OnCategoryItemClicked=void Function(CategoryDm);
class CategoriesTab extends StatelessWidget {
   CategoriesTab({super.key,required this.onCategoryItemClicked});
   OnCategoryItemClicked onCategoryItemClicked;
List<CategoryDm>categoriesList=CategoryDm.getAllCategories();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
child:Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Text('Pick your category\nof interest',style: TextStyle(fontSize: 20),),
    Expanded(child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
        crossAxisSpacing: 25.w,
          mainAxisSpacing: 20.h
        ),
        itemCount: categoriesList.length,

        itemBuilder: (context, index) => InkWell(
          onTap: (){
            onCategoryItemClicked(categoriesList[index]);
          },
          child: CategoryWidget(
              categoryDm: categoriesList[index], index: index),
        ),),


    ),
  ],
),


    );
  }
}
