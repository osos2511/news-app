import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/result.dart';

abstract class ArticlesRepository{
  Future<Result<List<ArticleEntity>>>getArticles(String sourceId);
}