import 'package:flutter/material.dart';
import 'package:news_app/core/utils/di/di.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/viewModel/sources_viewModel.dart';
import 'package:provider/provider.dart';
import '../../../../../../data_model/category_Dm/category_Dm.dart';
import '../widgets/sources_tab_widget.dart';

class SourcesView extends StatefulWidget {
   SourcesView({super.key,required this.categoryDm});
  CategoryDm categoryDm;


  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  var viewModel=getIt<SourcesViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDm.id);
  }
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SourcesViewModel>.value(
      value: viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context,value,child){
          if(viewModel.isLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(viewModel.errorMessage!=null){
            return Text(viewModel.errorMessage!);
          }
          List<SourceEntity>sources=viewModel.sources!;
          return SourcesTabWidget(sources: sources);
        },
      ),
    );
    //FutureBuilder(
//       future: ApiManager.getSources(widget.categoryDm.id),
//       builder: (context, snapshot){
//     if(snapshot.connectionState==ConnectionState.waiting){
//     return const Center(child: CircularProgressIndicator(),);
//     }
//     if(snapshot.data?.status=='error' || snapshot.hasError){
// return Text(snapshot.data?.message??snapshot.error.toString());
//     }
//
//     return SourcesWidget(sources: sources);
//     },);

}
}
