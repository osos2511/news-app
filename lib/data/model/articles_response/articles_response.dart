import 'Article.dart';
//model
class ArticlesResponse {
  String? status;
  num? totalResults;
  String? code;
  String? message;
  List<Article>? articles;

  ArticlesResponse({
      this.status, 
      this.totalResults,
    this.code,
    this.message,
      this.articles,});

  ArticlesResponse.fromJson(dynamic json) {
    status = json['status'];
    code=json['code'];
    message=json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}