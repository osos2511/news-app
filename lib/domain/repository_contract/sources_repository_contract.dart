import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/result.dart';

abstract class SourcesRepository{
  Future<Result<List<SourceEntity>>>getSources(String categoryId);
}