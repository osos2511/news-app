import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:news_app/result.dart';

abstract class SearchDataSource{
  Future<Result<List<Article>>> getNewsBySearch(String query);
}