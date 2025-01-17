import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/use_cases/sources_use_case.dart';
import 'package:news_app/result.dart';

@injectable
class SourcesViewModel extends ChangeNotifier {
  GetSourcesUseCase sourcesUseCase;
  @factoryMethod
  SourcesViewModel({required this.sourcesUseCase});
  List<SourceEntity>? sources;
  bool isLoading = false;
  String? errorMessage;
  void getSourcesByCategoryId(String categoryId) async {
      isLoading = true;
      notifyListeners();
      var result = await sourcesUseCase.execute(categoryId);
      isLoading=false;
      switch (result) {
        case Success<List<SourceEntity>>():
          sources = result.data;
        case ServerError<List<SourceEntity>>():
          errorMessage = result.message;
        case Error<List<SourceEntity>>():
        errorMessage=result.exception.toString();
      }
      notifyListeners();
  }
}
    //   if(response.status=='ok'){
    //     sources=response.sources;
    //   }else{
    //     errorMessage=response.message;
    //   }
    //   notifyListeners();
    // }catch(e){
    //   isLoading=false;
    //   errorMessage=e.toString();
    //   notifyListeners();
    // }

