import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/domain/entities/source_entity.dart';

class SourceWidget extends StatelessWidget {
   SourceWidget({super.key,required this.source,required this.isSelected});
SourceEntity source;
bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
        margin: REdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected? Colors.green:Colors.transparent,
          borderRadius:
          BorderRadius.circular(25.r),
          border: Border.all(color:Colors.green,width: 2.w),

        ),
        child: Text(source.name??'',
          style: TextStyle(color: isSelected?Colors.white:Colors.green),)
    );
  }
}
