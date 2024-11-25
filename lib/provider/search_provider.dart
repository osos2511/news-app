import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/articles_response/Article.dart';

class SearchProvider extends ChangeNotifier {
  String? search;
  bool isLoading=false;
  List<Article>articles=[];
  String errorMessage='';

  void searchName(String name) {
    search = name;
    if(search!=null&&search!.isNotEmpty){
      getAllSearchArticles(search!);

    }else{
      articles.clear();
      notifyListeners();
    }
  }
  Future<void>getAllSearchArticles(String q)async {
    isLoading=true;
    errorMessage='';
    notifyListeners();
    try{
      final response=await ApiManager.getSearchNews(q);
      if(response.status=='error'){
        errorMessage=response.message??'wrong answer';
      }else{
        articles=response.articles??[];
      }
    }catch(e){
      errorMessage='error occurred $e';
    }
    isLoading=false;
    notifyListeners();
  }
}