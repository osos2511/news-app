import 'package:injectable/injectable.dart';
import 'package:news_app/domain/repository_contract/search_repository_contract.dart';

import '../../result.dart';
import '../entities/article_entity.dart';
@injectable
class SearchUseCase{
  SearchRepository repository;
  @factoryMethod
  SearchUseCase({required this.repository});
  Future<Result<List<ArticleEntity>>> execute(String query){
    return repository.getNewsBySearch(query);
  }
}