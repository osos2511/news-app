import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:provider/provider.dart';

import '../widgets/article_item.dart';
import '../viewModel/articles_viewModel.dart';

class ArticlesView extends StatefulWidget {
  ArticlesView({super.key, required this.source});
  Source source;

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  var viewModel=ArticlesViewModel();
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
      builder: (context,value,child){
        if(viewModel.isLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(viewModel.errorMessage!=null){
          return Text(viewModel.errorMessage!);
        }
        List<Article> articles = viewModel.articles!;
        return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => ArticlesItem(
                        article: articles[index],
                      ),
                      itemCount: articles.length,
                    ),
                  );
      },),);

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
