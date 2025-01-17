import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source_contract/search_data_source.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repository_contract/search_repository_contract.dart';
import 'package:news_app/result.dart';

import '../model/articles_response/Article.dart';
@Injectable(as: SearchRepository)
class SearchRepositoryImpl extends SearchRepository{
  SearchDataSource dataSource;
  @factoryMethod
  SearchRepositoryImpl({required this.dataSource});
  @override
  Future<Result<List<ArticleEntity>>> getNewsBySearch(String query) async{
    var result=await dataSource.getNewsBySearch(query);
    switch(result){

      case Success<List<Article>>():
        return Success(data: result.data.map((article)=>article.toArticleEntity()).toList());
      case ServerError<List<Article>>():
        return ServerError(message: result.message, code: result.code);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }

}