import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import '../../result.dart';
import '../repository_contract/sources_repository_contract.dart';

//use case is a concept in sw engineering represent a functional requirement
//from user perspective and hiding details
@injectable
class GetSourcesUseCase{
  SourcesRepository repository;
  @factoryMethod
  GetSourcesUseCase({required this.repository});
  Future<Result<List<SourceEntity>>> execute(String sourceId){
    return repository.getSources(sourceId);
  }
}