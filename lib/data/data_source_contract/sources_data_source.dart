import '../../result.dart';
import '../model/sources_response/source.dart';

abstract class SourcesDataSource{
  //1-step one
  //this function get a list of articles base on Concrete(child) datasource
  Future<Result<List<Source>>> getSources(String categoryId);

}