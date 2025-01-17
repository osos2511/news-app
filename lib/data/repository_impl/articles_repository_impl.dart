import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/result.dart';
import '../../domain/repository_contract/articles_repository_contract.dart';
@Injectable(as: ArticlesRepository)
class ArticlesRepositoryImpl extends ArticlesRepository{
  ArticlesDataSource dataSource;
  @factoryMethod
  ArticlesRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<ArticleEntity>>>getArticles(String sourceId) async{
    var result=await dataSource.getArticles(sourceId);
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