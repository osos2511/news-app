import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/styles_manager.dart';
import 'package:news_app/data_model/category_Dm/category_Dm.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({super.key,required this.categoryDm,required this.index});
CategoryDm categoryDm;
int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDm.bgColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r),
            topLeft: Radius.circular(25.r),
            bottomLeft: Radius.circular(index.isEven?25:0),
          bottomRight: Radius.circular(index.isEven?0:25),
          ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryDm.imagePath,width: 142.w,height: 126.h,),
          Text(categoryDm.title,style: AppStyles.categoryTitle,),
        ],
      ),
    );
  }
}
