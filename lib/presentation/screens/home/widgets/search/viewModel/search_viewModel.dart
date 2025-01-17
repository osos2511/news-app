import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/use_cases/search_use_case.dart';
import 'package:news_app/result.dart';
@injectable
class SearchViewModel extends ChangeNotifier {
  @factoryMethod
  SearchViewModel({required this.searchUseCase});
  SearchUseCase searchUseCase;
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
      var result=await searchUseCase.execute(query);
      isLoading=false;
      switch(result){

        case Success<List<ArticleEntity>>():
          articles=result.data;
        case ServerError<List<ArticleEntity>>():
          errorMessage=result.message;
        case Error<List<ArticleEntity>>():
      errorMessage=result.exception.toString();
      }
      notifyListeners();
}
}