import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/use_cases/articles_use_case.dart';
import 'package:news_app/result.dart';
@injectable
class ArticlesViewModel extends ChangeNotifier{
  @factoryMethod
  ArticlesViewModel({required this.articlesUseCase});
  GetArticlesUseCase articlesUseCase;
  List<ArticleEntity>? articles;
  bool isLoading=false;
  String? errorMessage;
  void getNewsBySource(String sourceId) async {
    isLoading = true;
    notifyListeners();
    var result = await articlesUseCase.execute(sourceId);
    isLoading = false;
    switch (result) {
      case Success<List<ArticleEntity>>():
        articles = result.data;
      case ServerError<List<ArticleEntity>>():
        errorMessage = result.message;
      case Error<List<ArticleEntity>>():
        errorMessage = result.exception.toString();

    }
    notifyListeners();
  }
}