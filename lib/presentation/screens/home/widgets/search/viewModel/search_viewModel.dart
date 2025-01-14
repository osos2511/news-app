import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/result.dart';

import '../../../../../../domain/repository_contract/articles_repository_contract.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel({required this.articlesRepository});
  ArticlesRepository articlesRepository;
  String? search;
  bool isLoading=false;
  List<ArticleEntity>?articles;
  String? errorMessage;//Error from server when i get the data

  void searchName(String name) {
    search = name.trim();
    if(search!=null&&search!.isNotEmpty){
      getAllSearchArticles(search!);

    }else{
      articles?.clear();
      notifyListeners();
    }
  }
  Future<void>getAllSearchArticles(String query)async {

      isLoading=true;
      notifyListeners();
      var result=await articlesRepository.getNewsBySearch(query);
      isLoading=false;
      switch(result){

        case Success<List<ArticleEntity>>():
          Success(data: result.data);
        case ServerError<List<ArticleEntity>>():
          ServerError(message: result.message,code:result.code);
        case Error<List<ArticleEntity>>():
          Error(exception: result.exception);
      }
}
}