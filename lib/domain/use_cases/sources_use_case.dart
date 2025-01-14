import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/repository_contract/articles_repository_contract.dart';

import '../../result.dart';
import '../entities/article_entity.dart';
import '../repository_contract/sources_repository_contract.dart';

//use case is a concept in sw engineering represent a functional requirement
//from user perspective and hiding details
class GetSourcesUseCase{
  SourcesRepository repository;
  GetSourcesUseCase({required this.repository});
  Future<Result<List<SourceEntity>>> execute(String sourceId){
    return repository.getSources(sourceId);
  }
}