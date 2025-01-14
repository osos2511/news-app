import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/model/articles_response/Article.dart';
import 'package:news_app/data/model/articles_response/articles_response.dart';
import 'package:news_app/data/model/sources_response/SourcesResponse.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/result.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
  static const String baseUrl = 'newsapi.org';
  static const String sourcesEndPoint = '/v2/top-headlines/sources';
  static const String articlesEndPoint = '/v2/everything';
  static const String apiKey = '470af20fefcb46e588a00bdbce772b41';

  Future<Result<List<Source>>> getSources(String categoryId) async {
    Uri url = Uri.https(baseUrl, sourcesEndPoint, {
      'apiKey': apiKey,
      'category': categoryId,
    });
    try {
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == 'ok') {
        return Success(data: sourcesResponse.sources!);
      } else {
        return ServerError(
            message: sourcesResponse.message!, code: sourcesResponse.message!);
      }
    } catch (e) {
      return Error(exception: Exception(e));
    }
  }

  Future<Result<List<Article>>> getArticles(String sourceId) async {
    Uri url = Uri.https(
      baseUrl,
      articlesEndPoint,
      {'apiKey': apiKey, 'sources': sourceId},
    );

    try {
      http.Response serverResponse = await http.get(url);

      if (serverResponse.statusCode != 200) {
        return ServerError(
          message: "HTTP Error: ${serverResponse.statusCode}",
          code: serverResponse.statusCode.toString(),
        );
      }

      var json = jsonDecode(serverResponse.body);

      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);

      if (articlesResponse.status == 'ok') {
        return Success(data: articlesResponse.articles ?? []);
      } else {
        return ServerError(
          message: articlesResponse.message ?? "Unknown server error",
          code: "API_ERROR",
        );
      }
    } catch (e) {
      return Error(exception: Exception("Unexpected error: $e"));
    }
  }

  Future<Result<List<Article>>> getSearchNews(String query) async {
    Uri url =
        Uri.https(baseUrl, articlesEndPoint, {'apiKey': apiKey, 'q': query});
   try{
     http.Response serverResponse = await http.get(url);
     var json = jsonDecode(serverResponse.body);
     ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
     if (articlesResponse.status == 'ok') {
       return Success(data: articlesResponse.articles ?? []);
     } else {
       return ServerError(
         message: articlesResponse.message ?? "Unknown server error",
         code: "API_ERROR",
       );
     }

   }catch(e){
     return Error(exception: Exception("Unexpected error: $e"));

   }
  }
}
