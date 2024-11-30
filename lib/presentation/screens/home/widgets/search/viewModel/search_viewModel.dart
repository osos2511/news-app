import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/model/articles_response/Article.dart';

class SearchViewModel extends ChangeNotifier {
  String? search;
  bool isLoading=false;
  List<Article>?articles;
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
    try{
      isLoading=true;
      notifyListeners();
      var response=await ApiManager.getSearchNews(query);
      isLoading=false;
      if(response.status=='ok'){
        articles=response.articles??[];
      }
      else{
        errorMessage=response.message??'wrong in get the data';
      }
      notifyListeners();
    }catch(e){
      isLoading=false;
      errorMessage='error occurred $e'.toString();//if i arrive to server
      notifyListeners();
    }
  }
}