import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/result.dart';

abstract class ArticlesDataSource{
  //1-step one
  //this function get a list of articles base on Concrete(child) datasource
  Future<Result<List<Article>>> getArticles(String sourceId);
  Future<Result<List<Article>>> getNewsBySearch(String query);

}