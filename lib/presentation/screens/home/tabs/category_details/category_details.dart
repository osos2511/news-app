import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/data_model/category_Dm/category_Dm.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/widgets/sources_widget/sources_widget.dart';

class CategoryDetails extends StatefulWidget {
   CategoryDetails({super.key,required this.categoryDm});
CategoryDm categoryDm;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
int? isSelectedIndex;
bool isSelected=false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.categoryDm.id),
      builder: (context, snapshot){
    if(snapshot.connectionState==ConnectionState.waiting){
    return const Center(child: CircularProgressIndicator(),);
    }
    if(snapshot.data?.status=='error' || snapshot.hasError){
return Text(snapshot.data?.message??snapshot.error.toString());
    }
    List<Source>sources=snapshot.data!.sources!;
    return SourcesWidget(sources: sources);
    // return ListView.builder(itemBuilder: (context, index) => Text(sources[index].??''),
    // itemCount: sources.length,
    // );
    },);
  }
}
