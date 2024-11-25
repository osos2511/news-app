import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/model/articles_response/articles_response.dart';
import 'package:news_app/data/model/sources_response/SourcesResponse.dart';
class ApiManager{
  //https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
  static const String baseUrl='newsapi.org';
  static const String sourcesEndPoint='/v2/top-headlines/sources';
  static const String articlesEndPoint='/v2/everything';
  static const String apiKey='470af20fefcb46e588a00bdbce772b41';

  static Future<SourcesResponse> getSources(String categoryId)async{
    Uri url=Uri.https(baseUrl,sourcesEndPoint,{
      'apiKey':apiKey,
      'category':categoryId,
    });
    http.Response serverResponse=await http.get(url);
    var json=jsonDecode(serverResponse.body);
    SourcesResponse sourcesResponse=SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<ArticlesResponse> getArticles(String sourceId)async{
   Uri url=Uri.https(baseUrl,articlesEndPoint,{
     'apiKey':apiKey,
     'sources':sourceId
   });
   http.Response serverResponse=await http.get(url);
   var json=jsonDecode(serverResponse.body);
   ArticlesResponse articlesResponse=ArticlesResponse.fromJson(json);
   return articlesResponse;

  }

  static Future<ArticlesResponse> getSearchNews(String q)async{
    Uri url=Uri.https(baseUrl,articlesEndPoint,{
      'apiKey':apiKey,
      'q':q
    });
    http.Response serverResponse=await http.get(url);
    var json=jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse=ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}