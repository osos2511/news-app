import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source_contract/sources_data_source.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/result.dart';
import '../../domain/repository_contract/sources_repository_contract.dart';

@Injectable(as: SourcesRepository)
class SourcesRepositoryImpl extends SourcesRepository{
  SourcesDataSource dataSource;
  @factoryMethod
  SourcesRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<SourceEntity>>>getSources(String categoryId) async{
    var result=await dataSource.getSources(categoryId);
    switch(result){
      case Success<List<Source>>():
        return Success(data: result.data.map((source)=>source.toSourceEntity()).toList());
      case ServerError<List<Source>>():
        return ServerError(message: result.message, code: result.code);
      case Error<List<Source>>():
        return Error(exception: result.exception);
    }
  }





}