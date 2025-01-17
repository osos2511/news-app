import '../../result.dart';
import '../entities/article_entity.dart';

abstract class SearchRepository{
  Future<Result<List<ArticleEntity>>>getNewsBySearch(String query);


}