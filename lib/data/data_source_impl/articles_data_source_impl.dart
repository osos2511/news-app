import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:news_app/result.dart';
@Injectable(as:ArticlesDataSource)

class ArticlesApiDataSourceImpl extends ArticlesDataSource{
  ApiManager apiManager;
  @factoryMethod
  ArticlesApiDataSourceImpl({required this.apiManager});//constructor injection
  @override
  //step two
  Future<Result<List<Article>>> getArticles(String sourceId) async{
    var result=await apiManager.getArticles(sourceId);
    switch (result){
      case Success<List<Article>>():
        return Success(data: result.data);
      case ServerError<List<Article>>():
        return ServerError(message: result.message, code: result.code);
        case Error<List<Article>>():
          return Error(exception: result.exception);
    }
  }

  @override
  Future<Result<List<Article>>> getNewsBySearch(String query) {
    // TODO: implement getNewsBySearch
    throw UnimplementedError();
  }

}