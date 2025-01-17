import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/data_source_contract/search_data_source.dart';
import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:news_app/result.dart';
@Injectable(as:SearchDataSource)
class SearchApiDataSourceImpl extends SearchDataSource{
  ApiManager apiManager;
  @factoryMethod
  SearchApiDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Article>>> getNewsBySearch(String query) async{
   var result=await apiManager.getSearchNews(query);
   switch(result){

     case Success<List<Article>>():
       return Success(data: result.data);
     case ServerError<List<Article>>():
       return ServerError(message: result.message, code: result.code);
     case Error<List<Article>>():
       return Error(exception: result.exception);
   }
  }

}