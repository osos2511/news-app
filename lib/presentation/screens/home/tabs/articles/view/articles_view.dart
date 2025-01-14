import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/data_source_impl/articles_data_source_impl.dart';
import 'package:news_app/data/repository_impl/articles_repository_impl.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/use_cases/articles_use_case.dart';
import 'package:provider/provider.dart';

import '../widgets/article_item.dart';
import '../viewModel/articles_viewModel.dart';

class ArticlesView extends StatefulWidget {
  ArticlesView({super.key, required this.source});
  SourceEntity source;

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  var viewModel=ArticlesViewModel(
      articlesUseCase: GetArticlesUseCase(repository: ArticlesRepositoryImpl(
          dataSource: ArticlesApiDataSourceImpl(apiManager: ApiManager()))) );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySource(widget.source.id!);
  }
  @override
  void didUpdateWidget(covariant ArticlesView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.source.id!=widget.source.id){
      viewModel.getNewsBySource(widget.source.id!);
    }
  }
  @override
  Widget build(BuildContext context) {
return ChangeNotifierProvider.value(
  value: viewModel,
  child: Consumer<ArticlesViewModel>(
    builder: (context, viewModel, child) {
      if (viewModel.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (viewModel.errorMessage != null) {
        return Center(child: Text(viewModel.errorMessage!));
      }
      if (viewModel.articles == null || viewModel.articles!.isEmpty) {
        return const Center(child: Text("No articles available"));
      }
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) => ArticlesItem(
            article: viewModel.articles![index],
          ),
          itemCount: viewModel.articles!.length,
        ),
      );
    },
  ),
);


    // return FutureBuilder(
    //     future: ApiManager.getArticles(widget.source.id ?? ''),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (snapshot.data?.status == 'error' || snapshot.hasError) {
    //         return Text(snapshot.data?.message ?? snapshot.error.toString());
    //       }
    //       List<Article> articles = snapshot.data?.articles ?? [];
    //       return Expanded(
    //         child: ListView.builder(
    //           itemBuilder: (context, index) => ArticleItemWidget(
    //             article: articles[index],
    //           ),
    //           itemCount: articles.length,
    //         ),
    //       );
    //     });
  }
}
