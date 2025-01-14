import 'package:news_app/domain/repository_contract/articles_repository_contract.dart';

import '../../result.dart';
import '../entities/article_entity.dart';

//use case is a concept in sw engineering represent a functional requirement
//from user perspective and hiding details
class GetArticlesUseCase{
  ArticlesRepository repository;
  GetArticlesUseCase({required this.repository});
  Future<Result<List<ArticleEntity>>> execute(String sourceId){
    return repository.getArticles(sourceId);
  }
}